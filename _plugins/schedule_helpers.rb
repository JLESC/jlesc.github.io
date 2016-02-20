module Jekyll
  module Tags
    class TableSeparatorTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @cols = markup.strip
      end

      def render(context)
        "<tr class=\"table-separator\"><td colspan=\"#{@cols}\"></td></tr>"
      end
    end

    class ScheduleLabelTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @markup = markup.strip
      end

      def render(context)
        css_class, text = @markup.split(' ')

        "<span class=\"label label-#{css_class}\">#{text}</span>"
      end
    end

    class KeynoteLabelTag < ScheduleLabelTag
      def render(context)
        @markup = 'info Keynote'
        super
      end
    end

    class ResearchLabelTag < ScheduleLabelTag
      def render(context)
        @markup = 'default Research'
        super
      end
    end
  end
end

Liquid::Template.register_tag('table_separator', Jekyll::Tags::TableSeparatorTag)
Liquid::Template.register_tag('keynote_label', Jekyll::Tags::KeynoteLabelTag)
Liquid::Template.register_tag('research_label', Jekyll::Tags::ResearchLabelTag)
