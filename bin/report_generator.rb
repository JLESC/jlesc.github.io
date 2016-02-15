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

      collections['projects'].docs.each do |document|
        unless document.data['status'] == 'colab'
          document.output = Jekyll::Renderer.new(self, document, payload).run
          document.trigger_hooks(:post_render)
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

      output = PandocRuby.convert(output, :normalize, from: 'markdown+pipe_tables', to: :latex)
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
    end

    private
    def tex_cleanup
      puts '    cleanup obsolete stuff in LaTeX'
      document.content.gsub! /\\itemsep.*\n/, ''
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
