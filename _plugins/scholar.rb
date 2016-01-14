require 'jekyll/scholar'
require 'uri'

module Jekyll
  module TrimIEEECitation
    def trim_ieee_citation(input)
      input.gsub(/\[[0-9]+\]/, '')
    end
  end
end

# monkey patching filter to produce straight HTML link tags instead of markdown links
module Jekyll
  class Scholar
    class Markdown < BibTeX::Filter
      def apply(value)
        value.to_s.gsub(URI.regexp(['http','https','ftp'])) { |c| "<a href=\"#{$&}\">#{$&}</a>" }
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::TrimIEEECitation)
