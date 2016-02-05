module Jekyll
  module Tags
    class RenderPersonTagError < StandardError
      def initialize(msg)
        super(msg)
      end
    end

    class RenderPersonTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @person_id = markup.strip
        @person = nil
        @people
        @affiliations = nil
      end

      def get_person(context)
        @people = context.registers[:site].data['people']

        if @people.has_key?(@person_id)
          @person = @people[@person_id]
        elsif @people.has_key?(Liquid::Template.parse(@person_id).render(context))
          @person = @people[Liquid::Template.parse(@person_id).render(context)]
        else
          raise RenderPersonTagError.new \
            "PersonID '#{@person_id}' not found. Typo? Otherwise add it to _data/people.yml."
        end

      end

      def get_affiliations(context)
        unless @person.has_key?('affiliation')
          raise RenderPersonTagError.new "PersonID '#{@person_id}' has no 'affiliation' defined."
        end

        affies = context.registers[:site].data['orgs']

        if @person['affiliation'].is_a?(String)
          person_affies = [@person['affiliation']]
        else
          person_affies = @person['affiliation']
        end

        @affiliations = []
        for affi in person_affies
          unless affies.has_key?(affi)
            raise RenderPersonTagError.new \
              "AffiliationID '#{affi}' not found. Type? Otherwise add it to _data/orgs.yml."
          end

          @affiliations << affies[affi]
        end
      end

      def construct_name(context)
        get_person(context)

        unless @person.has_key?('sur_name')
          raise RenderPersonTagError.new "PersonID '#{@person_id}' has no 'sur_name' defined."
        end
        unless @person.has_key?('given_name')
          raise RenderPersonTagError.new "PersonID '#{@person_id}' has no 'given_name' defined."
        end

        given_name = @person['given_name']
        sur_name = @person['sur_name']

        "<span class=\"person given-name\">#{given_name}</span> <span class=\"person sur-name\">#{sur_name}</span>"
      end

      def construct_affiliation(context)
        get_affiliations(context)

        affies = []
        for affi in @affiliations
          affies << "<abbr class=\"person affiliation\" title=\"#{affi['title']}\">#{affi['abbr']}</abbr>"
        end

        affies.join(', ')
      end

      def render(context)
        "#{construct_name(context)} (#{construct_affiliation(context)})"
      end
    end
  end
end

Liquid::Template.register_tag('person', Jekyll::Tags::RenderPersonTag)
