module Jekyll
  module Tags
    class DurationTagError < StandardError
      def initialize(msg)
        super
      end
    end

    class DurationPMsTagError < DurationTagError
      def initialize(msg)
        super(msg)
      end
    end

    class DurationHumanizedTagError < DurationTagError
      def initialize(msg)
        super(msg)
      end
    end

    class DurationTag < Liquid::Tag
      SECONDS_PER_DAY = 86400

      def initialize(tag_name, markup, tokens)
        super
        @markup = markup.strip
      end

      def days_from_seconds(context)
        seconds = Float(Liquid::Template.parse(@markup).render(context))

        if seconds < 0
          raise DurationTagError.new "Invalid duration. Must be at least one second: #{seconds}"
        end

        (seconds / 86400) + 1
      end
    end

    class DurationPMsTag < DurationTag
      def render(context)
        days = days_from_seconds(context)
        "#{(days / 30.0).round(2)} PM"
      end
    end

    class DurationHumanizedTag < DurationTag
      DAYS_PER_MONTHS = 30

      def days_to_s(days)
        if days == 1
          "#{days} day"
        else
          "#{days} days"
        end
      end

      def months_to_s(months)
        if months == 1
          "#{months} month"
        else
          "#{months} months"
        end
      end

      def render(context)
        total_days = days_from_seconds(context)
        days = Integer(total_days % DAYS_PER_MONTHS)
        months = Integer((total_days - days) / DAYS_PER_MONTHS)

        if months == 0
          days_to_s(days)
        else
          "#{months_to_s(months)} and #{days_to_s(days)}"
        end
      end
    end
  end
end

Liquid::Template.register_tag('duration_pms', Jekyll::Tags::DurationPMsTag)
Liquid::Template.register_tag('duration_humanized', Jekyll::Tags::DurationHumanizedTag)
