#!/usr/bin/env ruby
=begin rdoc
coding: UTF-8
:markup: RDoc
:title: LaTeX Report Generator

= LaTeX Generator

== About
This script is an exporter for the projects.
It generates LaTeX files for each project to be used in the annual JLESC report.
Each project's LaTeX file is accompanied with a BibTeX file with all citations used by the project.

== Usage
You must run this script from the source directory of the JLESC site, i.e. the parent of the
directory this script is in.
Given you have loaded the correct Ruby environment for the JLESC site
(cf. {Testing Locally on the JLESC Webpage Wiki}[https://github.com/JLESC/jlesc.github.io/wiki/Testing-Locally]).
Then simply run it from the command line:

    bundle exec ./bin/report_generator.rb

The LaTeX files will be written to +./latex_out+.

== Details
This script heavily depends on monkey patching a few central functionalities of _Jekyll_.
In detail, the patches are:

[+Jekyll::Converters::Markdown::KramdownParser#convert+]

  By default, this method calls +Kramdown::Document#to_html+, but as we want _LaTeX_, we call
  +to_latex+ instead.

[+Jekyll::Site#render+]

  It is only considering the site's _projects_ collection of +Jekyll::Document+s.
  Also, the _topics_ database is read and pre-processed a little bit for further use.

[+Jekyll::Site#write+]

  Writes each rendered and _kramdown_-processed +Jekyll::Document+'s content of the _projects_
  collection to the LaTeX file.
  It also writes out the accompanying BibTeX file for each project.
  Finally, it generates one LaTeX file per _topic_ including all project files of the _topic_.

[+Jekyll::Document+]

  Got a new attribute +bibtex+ storing the +BibTeX::Bibliography+ with all citations used within
  the document.

[+Jekyll::Document#destination+]

  Does not construct the output path from the site object but only relative to the given parameter
  (base path).

[+Jekyll::Renderer#run+]

  This is where the rendering and conversion magic happens.
  Prior to passing the document's Markdown content to the Liquid processor, all used citations are
  gathered (cf. new method +Jekyll::Renderer#read_used_citations+) to later construct the document
  specific BibTeX file.
  Then, the Markdown content is modified via the new method +Jekyll::Renderer#md_cleanup+ to remove
  or replace any Liquid tags which will produce plain HTML or other obtrusive code after Liquid
  processing.
  After the Liquid engine is done, the output is passed to _kramdown_ for the final conversion from
  Markdown to LaTeX.
  In the end, the converted LaTeX content is again cleaned up and tweaked to match the specific
  requirements of the JLESC annual report (cf. new method +Jekyll::renderer#tex_cleanup+).

== Future Notes
As this script was written with a specific set of gems and versions and heavily depends on monkey
patching, the script might break in unexpected (and possible silent) ways in the future.
The most important dependencies are the following:

  bibtex-ruby (4.2.0)
  jekyll (3.1.1)
  jekyll-scholar (5.7.0)
  kramdown (1.9.0)
  liquid (3.0.6)

For the full list refer to the +Gemfile.lock+ file on commit SHA +9afcb40fbda60cf71e65fb4ebd11b8714b35697c+.
=end

require 'bundler/setup'
Bundler.require(:default)
require 'jekyll'
require 'bibtex'

BIBLIOGRAPHY_MATCHER = /{%\sbibliography\s.*--file\s(?<bibfile>[\w\/]*)\.bib\s%}/
BIBLIOGRAPHY_MATCHER_JLESC = /{%\sbibliography\s.*--file\sjlesc\.bib\s%}/
BIBLIOGRAPHY_MATCHER_EXTERNAL = /{%\sbibliography\s.*--file\sexternal\/[\w\/]*\.bib\s%}/
CITATION_MATCHER = /{%\scite\s(?<bibtex_id>\w*)\s--file\s(?<bibfile>[\w\/]*)\.bib\s%}/


def sanitize_for_latex(content)
  # TODO: don't re-sanitize those which are already escaped!
  content.gsub! '&', '\\\&'
end


def create_clean_bibtex_entry(entry, document, own=nil)
  values = entry.to_hash

  values.update(:keywords => '') unless values.has_key? :keywords

  values.each_pair do |field, value|
    v = value.to_s

    v.gsub! /^[\{"]*(.*?)[}"]*$/, '\1'

    case field
      when :bibtex_key
        values[:bibtex_key] = "#{v}-#{document.data['slug'].gsub(/_/, '-')}"
      when :keywords
        words = value.split(',').each {|w| w.strip}
        words << 'own' if own
        values[:keywords] = words.join(', ')
      else
        values[field] = v
    end
  end

  values.delete :keywords if values[:keywords].length == 0

  BibTeX::Entry.new(values)
end


module Jekyll
  module Converters
    class Markdown
      class KramdownParser
        def convert(content)
          Kramdown::Document.new(content, @config).to_latex
        end
      end
    end
  end

  class Site
    def render
      puts 'Rendering ...'
      relative_permalinks_are_deprecated

      payload = site_payload

      Jekyll::Hooks.trigger :site, :pre_render, self, payload

      # TODO: move this into a separate block registered as a :pre_render hook for :site
      @topics = {}
      data['topics'].each_pair do |topic_id, topic_hash|
        topic_hash.update({projects: []})
        @topics.update({topic_id.to_sym => topic_hash})
      end

      collections['projects'].docs.each do |document|
        unless document.data['status'] == 'help_wanted'
          document.output = Jekyll::Renderer.new(self, document, payload).run
          document.trigger_hooks(:post_render)
          @topics[document.data['topics'].first.to_sym][:projects] << document.data['slug']
        end
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
      bibfiles = []
      collections['projects'].docs.each do |document|
        if document.data['status'] == 'help_wanted'
          next
        end

        unless document.bibtex
          puts "WARNING: No BibTeX for #{document.data['slug']}"
        end
        bibfile = document.data['slug'] + '.bib'
        bibtex_out = File.join('projects', bibfile)
        puts "  - #{bibtex_out}"
        document.bibtex.save_to(File.join(dest, bibtex_out))
        bibfiles << bibfile
      end

      puts "writing Topics files to #{dest} ..."
      @topics.each_pair do |topic_id, topic_hash|
        file = "#{topic_id.to_s}.tex"
        puts "  - #{file}"
        File.open(File.join(dest, file), 'wb') do |f|
          output = "\\section{#{topic_hash['title']}}\\label{topic-#{topic_id.to_s}}\n"
          output += topic_hash['desc']
          output += "\n"
          topic_hash[:projects].each do |project|
            output += "\\input{projects/#{project}}\n"
          end
          sanitize_for_latex(output)
          f.write(output)
        end
      end
    end
  end

  class Document
    attr_accessor :bibtex

    def destination(dest)
      raw_url = URL.unescape_path(url)
      if raw_url.end_with? '/'
        tex_file = raw_url[0, raw_url.length - 1]
      else
        tex_file = raw_url
      end
      puts "  - #{tex_file}"
      path = File.join(dest, tex_file)
      path << output_ext unless path.end_with? output_ext
      path
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
        document.content = output

        post_liquid_cleanup
      end

      output = convert(document.content)
      document.content = output

      tex_cleanup

      document.content
    end

    def output_ext
      '.tex'
    end

    private
    ##
    # Scans the content of the current document for occurrences of _jekyll-scholar_'s +cite+ Liquid
    # tag and gathers the BibTeX key and the BibTeX source file of the key.
    #
    # Returns an array of hashes of the form
    #
    #   [{:bibfile => '', :bibtex_id => ''}, ...]
    #
    def gather_citations
      @citations = []
      document.content.scan CITATION_MATCHER do |bibtex_id, bibfile|
        @citations << {:bibfile => bibfile, :bibtex_id => bibtex_id}
      end
      @citations
    end

    private
    ##
    # Scans the content of the current document for occurrences of _jekyll-scholar_'s +bibliography+
    # Liquid tag and gathers the BibTeX source file name.
    # Each file is open, read and parsed by _bibtex-ruby_.
    #
    # Returns hash of the form
    #
    #   {BIBFILE_BASENAME => BibTeX::Bibliography}
    #
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
    ##
    # Reads and gathers all used citations of the current document and puts them into a new
    # +BibTeX::Bibliography+ of the +Jekyll::Document+.
    # Citations, which originates in the JLESC BibTeX file (i.e. +jlesc.bib+) are tagged with the
    # keyword _own_ to denote publications created within JLESC.
    #
    # Returns nothing.
    #
    def read_used_citations
      puts '    reading used citations'

      @citations = gather_citations
      @bibfiles = get_bibfiles

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

          cite[:bibtex] = create_clean_bibtex_entry(bib_entry, document, cite[:bibfile] =~ /jlesc/)
        end

        num_ref_jlesc = @citations.find_all {|e| e[:bibfile] =~ /jlesc/}.length
        num_ref_external = @citations.find_all {|e| e[:bibfile] !~ /jlesc/}.length
        puts "      Found #{num_ref_jlesc} JLESC citations"
        puts "      Found #{num_ref_external} external citations"
      end

      num_ref_jlesc ||= 0
      num_ref_external ||= 0

      if num_ref_jlesc == 0
        document.content.gsub! BIBLIOGRAPHY_MATCHER_JLESC, "\nNo publication yet."
      end

      if num_ref_external == 0
        document.content.gsub! BIBLIOGRAPHY_MATCHER_EXTERNAL, "\nNo external references."
      end

      document.bibtex = BibTeX::Bibliography.new
      @citations.each do |cite|
        document.bibtex << cite[:bibtex]
      end
    end

    private
    ##
    # Cleans up the Markdown of the current document.
    #
    def md_cleanup
      puts '    cleaning up obsolete stuff in Markdown'
      # generation/output of the bibliography (note: the LaTeX package _biblatex_ is used)
      # a) the JLESC publications
      document.content.gsub! BIBLIOGRAPHY_MATCHER_JLESC, '\printbibliography[heading=none,keyword=own]'
      # b) external references
      document.content.gsub! BIBLIOGRAPHY_MATCHER_EXTERNAL, '\printbibliography[heading=none,notkeyword=own]'

      # the _jekyll-scholar_ +cite+ Liquid tag needs to be replace as it generates HTML code
      document.content.gsub! CITATION_MATCHER, "\\cite{\\k<bibtex_id>-#{document.data['slug'].gsub(/_/, '-')}}"
    end

    private
    def post_liquid_cleanup
      puts '    cleaning up Markdown after Liquid processing'
      document.content.gsub! /<span class="person given-name">(.*?)<\/span>/, '\1'
      document.content.gsub! /<span class="person sur-name">(.*?)<\/span>/, '\1'
      document.content.gsub! /<abbr title=".*?" class="initialism" data-toggle="tooltip">(.*?)<\/abbr>/, '\1'
    end

    private
    ##
    # Cleans up the LaTeX as generated by _kramdown_
    #
    def tex_cleanup
      puts '    cleanup obsolete stuff in LaTeX'
      document.content.gsub! /\\textbackslash\{}printbibliography/, '\printbibliography'
      document.content.gsub! /\\textbackslash\{}cite\\\{(.*?)\\}/, '\cite{\1}'

      puts '    increase heading levels'
      # for the annual report the level of headings of the project reports need to be increased
      # a) headings within a project need to be named paragraphs
      document.content.gsub! /\\subsection{(.*)}\\label/, '\subsubsection{\1}~\\\label'
      # b) project titles need to be two levels down
      document.content.gsub! /\\section{(.*)}\\label/, '\subsection{\1}\label'  # TODO: do we need that here?

      # to fix multiple occurrences of labels in the aggregated report, we prepend each label with
      # the project's slug
      document.content.gsub! /\\label{([\w-]*)}/, "\\label{#{document.data['slug']}-\\1}"

      # wrap the project's report in it's own _biblatex_ reference section
      document.content.prepend("\\begin{refsection}[projects/#{document.data['slug']}]\n\n")
      document.content += "\n\\end{refsection}\n"

      # add the project's title
      document.content.prepend("\\subsection{#{document.data['title']}}\\label{#{document.data['title'].downcase.gsub(/\s/, '-')}}\n\n")
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
      @latex_path = File.join(@site.source, 'latex_out')
    end

    def run
      @site.reset
      @site.read
      @site.generate
      @site.render
      @site.write

      # create the annual report main file ...
      report_dest = File.join(@latex_path, "report_#{Date.today.year}.tex")
      # unless it already exists
      unless test('e', report_dest)
        FileUtils.cp(File.join(@site.source, '_templates', 'report', "report.tex"),
                     report_dest)
      end

      # copy the JLESC logo to the LaTeX directory
      FileUtils.cp(File.join(@site.source, '_assets', 'images', 'jlesc_logo.jpg'),
                   File.join(@latex_path, 'jlesc_logo.png'))

    end
  end
end

Jekyll::ReportGenerator.process
