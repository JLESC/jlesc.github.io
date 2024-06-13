module Jekyll
  module Tags
    class RenderLightboxImageTagError < StandardError
      def initialize(msg)
        super
      end
    end

    class RenderLightboxImageTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        @markup = markup.strip
        @image = @markup.split[0]
      end

      def render(context)

        image = Liquid::Template.parse("{% image #{@markup}  %}").render(context)
        image_path = Liquid::Template.parse("{% image_path #{@image} %}").render(context)

        "<div class=\"row lightbox-container\"><a href=\"#\" class=\"lightbox-link\" data-featherlight=\"#{image_path}\">#{image}</a></div>"
      end
    end
  end
end

Liquid::Template.register_tag('lightbox_image', Jekyll::Tags::RenderLightboxImageTag)
