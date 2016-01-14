require "jekyll-assets"

# from https://github.com/jekyll/jekyll-assets/issues/199#issuecomment-170295836
class Jekyll::ImagePath < Jekyll::Assets::Liquid::Tag

  def initialize(tag, args, tokens)
    super("img", args, tokens)
  end

  private
  def build_html(args, sprockets, asset, path = get_path(sprockets, asset))
    path
  end

end

Liquid::Template.register_tag('image_path', Jekyll::ImagePath)
