#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require(:default, :report)
require 'jekyll'
require 'pandoc-ruby'


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

      @topics.each_pair do |topic_id, topic_hash|
        file = "#{topic_id.to_s}.tex"
        puts "  #{file}"
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
    def destination(dest)
      puts "  #{URL.unescape_path(url)}"
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
    def md_cleanup
      puts '    cleaning up obsolete stuff in Markdown'
      document.content.gsub! /{%\sbibliography\s.*--file\s(.*)\.bib\s%}/, '\bibliography{\1}'
      document.content.gsub! /{:\.person-months-table.*}/, "|   |   |\n|---+---|"

      document.content.gsub! /{%\scite\s(\w*)\s.*\s%}/, '\cite \1'

      document.content = "# #{document.data['title']}\n#{document.content}"
    end

    private
    def tex_cleanup
      puts '    cleanup obsolete stuff in LaTeX'
      document.content.gsub! /\\itemsep.*\n/, ''

      puts '    increase heading levels'
      document.content.gsub! /\\section{(.*)}\\label/, '\subsubsection{\1}\label'
      document.content.gsub! /\\subsection{(.*)}\\label/, '\paragraph{\1}~\\\label'
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
