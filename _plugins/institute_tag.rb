module Jekyll
  module Tags
    class RenderInstituteTagError < StandardError
      def initialize(msg)
        super(msg)
      end
    end

    class RenderInstituteBaseTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @markup = markup.strip
        @institute = nil
        @institutes = nil
      end

      def get_institute(context)
        @institutes = context.registers[:site].data['orgs']

        @institute_id = Liquid::Template.parse(@markup).render(context)

        if @institutes.has_key?(@institute_id)
          @institute = @institutes[@institute_id]
        else
          raise RenderInstituteTagError.new \
            "InstituteID '#{@institute_id}' not found. Probably a typo? See _data/orgs.yml."
        end
      end

      def render(context)
        "#{construct_institute(context)}"
      end
    end

    class RenderInstituteTag < RenderInstituteBaseTag
      def construct_institute(context)
        get_institute(context)

        unless @institute.has_key?('title')
          raise RenderInstituteTagError.new "InstituteID '#{@institute_id}' has no 'title' defined."
        end

        "<span class=\"institute\">#{@institute['title']}</span>"
      end
    end

    class RenderInstituteShortTag < RenderInstituteBaseTag
      def construct_institute(context)
        get_institute(context)

        unless @institute.has_key?('title')
          raise RenderInstituteTagError.new "InstituteID '#{@institute_id}' has no 'title' defined."
        end
        unless @institute.has_key?('abbr')
          raise RenderInstituteTagError.new "InstituteID '#{@institute_id}' has no 'abbr' defined."
        end

        "<abbr title=\"#{@institute['title']}\" class=\"initialism\">#{@institute['abbr']}</abbr>"
      end
    end
  end
end

Liquid::Template.register_tag('institute', Jekyll::Tags::RenderInstituteTag)
Liquid::Template.register_tag('institute_short', Jekyll::Tags::RenderInstituteShortTag)
