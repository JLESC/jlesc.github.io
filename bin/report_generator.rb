#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require(:default, :report)
require 'jekyll'
require 'pandoc-ruby'
require 'bibtex'

BIBLIOGRAPHY_MATCHER = /{%\sbibliography\s.*--file\s(?<bibfile>[\w\/]*)\.bib\s%}/
BIBLIOGRAPHY_MATCHER_JLESC = /{%\sbibliography\s.*--file\sjlesc\.bib\s%}/
BIBLIOGRAPHY_MATCHER_EXTERNAL = /{%\sbibliography\s.*--file\sexternal\/[\w\/]*\.bib\s%}/
CITATION_MATCHER = /{%\scite\s(?<bibtex_id>\w*)\s--file\s(?<bibfile>[\w\/]*)\.bib\s%}/


module Jekyll
  class Site
    def render
      puts 'Rendering ...'
      relative_permalinks_are_deprecated

      payload = site_payload

      Jekyll::Hooks.trigger :site, :pre_render, self, payload

      @topics = {}
      data['topics'].each_pair do |topic_id, topic_hash|
        topic_hash.update({projects: []})
        @topics.update({topic_id.to_sym => topic_hash})
      end

      collections['projects'].docs.each do |document|
        document.output = Jekyll::Renderer.new(self, document, payload).run
        document.trigger_hooks(:post_render)
        @topics[document.data['topics'].first.to_sym][:projects] << document.data['slug']
      end

      Jekyll::Hooks.trigger :site, :post_render, self, payload
    rescue Errno::ENOENT
      # ignore missing layout dir
    end

    def write
      dest = File.join(source, 'latex_out')
      puts "writing LaTeX documents to #{dest} ..."
      collections['projects'].docs.each do |document|
        document.write(dest)
      end

      puts "writing BibTeX files to #{dest} ..."
      collections['projects'].docs.each do |document|
        unless document.bibtex
          puts "WARNING: No BibTeX for #{document.data['slug']}"
        end
        bibtex_out = File.join('projects', document.data['slug'] + '.bib')
        puts "  - #{bibtex_out}"
        document.bibtex.save_to(File.join(dest, bibtex_out))
      end

      puts "writing Topics files to #{dest} ..."
      @topics.each_pair do |topic_id, topic_hash|
        file = "#{topic_id.to_s}.tex"
        puts "  - #{file}"
        File.open(File.join(dest, file), 'wb') do |f|
          output = "\\subsection{#{topic_hash['title']}}\\label{topic-#{topic_id.to_s}}\n"
          output += topic_hash['desc']
          output += "\n"
          topic_hash[:projects].each do |project|
            output += "\\include{projects/#{project}}\n"
          end
          f.write(output)
        end
      end
    end
  end

  class Document
    attr_accessor :bibtex

    def destination(dest)
      puts "  - #{URL.unescape_path(url)}"
      path = File.join(dest, URL.unescape_path(url))
      path << output_ext unless path.end_with? output_ext
      path
    end

    def write(dest)
      path = destination(dest)
      FileUtils.mkdir_p(File.dirname(path))
      File.open(path, 'wb') do |f|
        f.write(output)
      end

      trigger_hooks(:post_write)
    end
  end

  class Renderer
    def run
      puts "  Markdown file: #{document.relative_path}"

      read_used_citations
      md_cleanup

      payload["page"] = document.to_liquid

      if document.respond_to? :pager
        payload["paginator"] = document.pager.to_liquid
      end

      if document.is_a?(Document) && document.collection.label == 'posts'
        payload['site']['related_posts'] = document.related_posts
      end

      # render and transform content (this becomes the final content of the object)
      payload['highlighter_prefix'] = converters.first.highlighter_prefix
      payload['highlighter_suffix'] = converters.first.highlighter_suffix

      document.trigger_hooks(:pre_render, payload)

      info = {
          :filters   => [Jekyll::Filters],
          :registers => { :site => site, :page => payload['page'] }
      }

      output = document.content

      if document.render_with_liquid?
        output = render_liquid(output, payload, info, document.path)
      end

      output = PandocRuby.convert(output, :normalize, :no_wrap, from: 'markdown+pipe_tables', to: :latex)
      document.content = output

      tex_cleanup

      document.content
    end

    def output_ext
      '.tex'
    end

    private
    def gather_citations
      @citations = []
      document.content.scan CITATION_MATCHER do |bibtex_id, bibfile|
        @citations << {:bibfile => bibfile, :bibtex_id => bibtex_id}
      end
      @citations
    end

    private
    def get_bibfiles
      puts '      reading in BibTeX files'
      @bibfiles = {}
      document.content.scan BIBLIOGRAPHY_MATCHER do |bibfile|
        puts "        - #{bibfile[0]}.bib"
        file = File.join(@site.source, '_bibliography', bibfile[0] + '.bib')
        @bibfiles[bibfile[0]] = BibTeX.open(file)
      end
      @bibfiles
    end

    private
    def read_used_citations
      puts '    reading used citations'

      @citations ||= gather_citations
      @bibfiles ||= get_bibfiles

      if @citations.length < 1
        puts "WARNING: no citations for project #{document.data['slug']}"
      else
        @citations.each do |cite|
          unless @bibfiles[cite[:bibfile]]
            raise StandardError.new "Bibliography not included: #{cite[:bibfile]}"
          end
          bib_entry = @bibfiles[cite[:bibfile]][cite[:bibtex_id]]

          unless bib_entry
            puts "WARNING: BibTeX key '#{cite[:bibtex_id]}' not found in #{cite[:bibfile]}.bib."
          end

          cite[:bibtex] = BibTeX::Entry.new(bib_entry.to_hash)
          cite[:bibtex].key = "#{cite[:bibtex].key}-#{document.data['slug'].gsub(/_/, '-')}"

          if cite[:bibfile] =~ /jlesc/
            cite[:bibtex].add :keywords => [] unless cite[:bibtex].has_field? :keywords
            cite[:bibtex][:keywords] << 'own'
          end
        end

        puts "      Found #{@citations.find_all {|e| e[:bibfile] =~ /jlesc/}.length} JLESC citations"
        puts "      Found #{@citations.find_all {|e| e[:bibfile] !~ /jlesc/}.length} external citations"
      end

      document.bibtex = BibTeX::Bibliography.new
      @citations.each do |cite|
        document.bibtex << cite[:bibtex]
      end
    end

    private
    def md_cleanup
      puts '    cleaning up obsolete stuff in Markdown'
      document.content.gsub! BIBLIOGRAPHY_MATCHER_JLESC, '\printbibliography[heading=none,keyword=own]'
      document.content.gsub! BIBLIOGRAPHY_MATCHER_EXTERNAL, '\printbibliography[heading=none,notkeyword=own]'
      document.content.gsub! /{:\.person-months-table.*}/, "|   |   |\n|---+---|"

      document.content.gsub! CITATION_MATCHER, "\\cite \\k<bibtex_id>-#{document.data['slug'].gsub(/_/, '-')}"
    end

    private
    def tex_cleanup
      puts '    cleanup obsolete stuff in LaTeX'
      document.content.gsub! /\\itemsep.*\n/, ''

      puts '    increase heading levels'
      document.content.gsub! /\\section{(.*)}\\label/, '\subsubsection{\1}\label'
      document.content.gsub! /\\subsection{(.*)}\\label/, '\paragraph{\1}~\\\label'

      document.content.prepend("\\begin{refsection}[#{document.data['slug']}]\n\n")
      document.content.prepend("\\subsubsection{#{document.data['title']}}\\label{#{document.data['title'].downcase.gsub(/\s/, '-')}}\n\n")

      document.content += "\n\\end{refsection}\n"
    end
  end

  class ReportGenerator
    class << self
      def process
        @generator = Jekyll::ReportGenerator.new
        @generator.run
      end
    end

    def initialize
      @site = Jekyll::Site.new(Jekyll::Command.configuration_from_options({serving: false}))
    end

    def run
      @site.reset
      @site.read
      @site.generate
      @site.render
      @site.write
    end
  end
end

Jekyll::ReportGenerator.process
