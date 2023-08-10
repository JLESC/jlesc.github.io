require "jekyll-assets"

# from https://github.com/jekyll/jekyll-assets/issues/199#issuecomment-170295836
#
# Modified by skendergashi (https://github.com/skendergashi)
class Jekyll::ImagePath < Liquid::Tag

  def initialize(tag, args, tokens)
    @args = args.gsub("'", "")
    super("img", args, tokens)
  end

  def render(context)
    if @args.include? "/"
      return @args.strip
    else
      return "/assets/images/#@args".strip
    end
  end

end

Liquid::Template.register_tag('image_path', Jekyll::ImagePath)
