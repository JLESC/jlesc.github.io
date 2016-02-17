module Jekyll
  module Tags
    class RenderPositionTagError < StandardError
      def initialize(msg)
        super(msg)
      end
    end

    class RenderPositionTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @markup = markup.strip
      end

      def render(context)
        positions = context.registers[:site].data['positions']

        position_id = Liquid::Template.parse(@markup).render(context)

        if position_id.length > 0
          unless positions.has_key?(position_id)
            raise RenderPositionTagError.new \
              "PositionID '#{position_id}' not found. Typo? See '_data/positions.yml'."
          end

          positions[position_id]['title']
        end
      end
    end
  end
end

Liquid::Template.register_tag('person_position', Jekyll::Tags::RenderPositionTag)
