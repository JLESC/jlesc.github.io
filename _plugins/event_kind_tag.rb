module Jekyll
  module Tags
    class RenderEventKindTagError < StandardError
      def initialize(msg)
        super(msg)
      end
    end

    class RenderEventKindTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @kind_id = markup.strip
        @kind = nil
        @kinds = nil
      end

      def get_kind(context)
        @kinds = context.registers[:site].data['event_kinds']

        rendered = Liquid::Template.parse(@kind_id).render(context)

        if @kinds.has_key?(rendered)
          @kind = @kinds[rendered]
        else
          raise RenderEventKindTagError.new \
            "EventKindID '#{rendered}' not found. Probably a typo? See _data/event_kinds.yml."
        end
      end

      def construct_kind(context)
        get_kind(context)

        unless @kind.has_key?('title')
          raise RenderEventKindTagError.new "EventKindID '#{@kind_id}' has no 'title' defined."
        end

        "<span class=\"event-kind\">#{@kind['title']}</span>"
      end

      def render(context)
        "#{construct_kind(context)}"
      end
    end
  end
end

Liquid::Template.register_tag('event_kind', Jekyll::Tags::RenderEventKindTag)
