module Jekyll
  module Tags
    class RenderProjectStatusTagError < StandardError
      def initialize(msg)
        super(msg)
      end
    end

    class RenderProjectStatusTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @markup = markup.strip
        @status = nil
        @states = nil
      end

      def get_status(context)
        @states = context.registers[:site].data['project_states']

        @status_id = Liquid::Template.parse(@markup).render(context)

        if @states.has_key?(@status_id)
          @status = @states[@status_id]
        else
          raise RenderProjectStatusTagError.new \
            "ProjectStatusID '#{@status_id}' not found. Probably a typo? See _data/project_states.yml."
        end
      end

      def construct_status(context)
        get_status(context)

        unless @status.has_key?('title')
          raise RenderProjectStatusTagError.new "ProjectStatusID '#{@status_id}' has no 'title' defined."
        end

        "<span class=\"project-status project-status-#{@status_id}\">#{@status['title']}</span>"
      end

      def render(context)
        "#{construct_status(context)}"
      end
    end
  end
end

Liquid::Template.register_tag('project_status', Jekyll::Tags::RenderProjectStatusTag)
