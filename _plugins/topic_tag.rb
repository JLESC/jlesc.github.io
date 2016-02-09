module Jekyll
  module Tags
    class RenderTopicTagError < StandardError
      def initialize(msg)
        super(msg)
      end
    end

    class RenderTopicTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @topic_id = markup.strip
        @topic = nil
        @topics = nil
      end

      def get_topic(context)
        @topics = context.registers[:site].data['topics']

        rendered = Liquid::Template.parse(@topic_id).render(context)

        if @topics.has_key?(rendered)
          @topic = @topics[rendered]
        else
          raise RenderTopicTagError.new \
            "TopicID '#{rendered}' not found. Probably a typo? See _data/topics.yml."
        end
      end

      def construct_topic(context)
        get_topic(context)

        unless @topic.has_key?('title')
          raise RenderTopicTagError.new "TopicID '#{@topic_id}' has no 'title' defined."
        end

        "<span class=\"topic topic-title\">#{@topic['title']}</span>"
      end

      def render(context)
        "#{construct_topic(context)}"
      end
    end
  end
end

Liquid::Template.register_tag('topic', Jekyll::Tags::RenderTopicTag)
