require_relative './institute_tag'


module Jekyll
  module Tags
    class RenderPersonTagError < StandardError
      def initialize(msg)
        super(msg)
      end
    end

    class PersonBaseTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @person_id = markup.strip
        @person = nil
        @people
      end

      def get_person(context)
        @people = context.registers[:site].data['people']

        rendered = Liquid::Template.parse(@person_id).render(context)

        if @people.has_key?(rendered)
          @person = @people[rendered]
        else
          raise RenderPersonTagError.new \
            "PersonID '#{rendered}' not found. Typo? Otherwise add it to _data/people.yml."
        end

        unless @person.has_key?('sur_name')
          raise RenderPersonTagError.new "PersonID '#{@person_id}' has no 'sur_name' defined."
        end
        unless @person.has_key?('given_name')
          raise RenderPersonTagError.new "PersonID '#{@person_id}' has no 'given_name' defined."
        end

        @given_name = @person['given_name']
        @sur_name = @person['sur_name']
      end

      def get_affiliations(context)
        unless @person.has_key?('affiliation')
          raise RenderPersonTagError.new "PersonID '#{@person_id}' has no 'affiliation' defined."
        end

        if @person['affiliation'].is_a?(String)
          @person['affiliation'] = [@person['affiliation']]
        end
      end

      def render(context)
        get_person(context)
        get_affiliations(context)
      end
    end

    module PersonNameTrait
      def construct_name
        "<span class=\"person given-name\">#{@given_name}</span> <span class=\"person sur-name\">#{@sur_name}</span>"
      end
    end

    module PersonInverseNameTrait
      def construct_name
        "<span class=\"person sur-name\">#{@sur_name}</span>, <span class=\"person given-name\">#{@given_name}</span>"
      end
    end

    module AffiliationsTrait
      def construct_affiliation(context)
        affies = []
        for affi in @person['affiliation']
          affies << Liquid::Template.parse("{% institute_short #{affi} %}").render(context)
        end

        affies.join(', ')
      end
    end


    class RenderPersonTag < PersonBaseTag
      include PersonNameTrait
      include AffiliationsTrait

      def render(context)
        super(context)
        "#{construct_name} (#{construct_affiliation(context)})"
      end
    end

    class RenderPersonShortTag < PersonBaseTag
      include PersonNameTrait

      def render(context)
        super(context)
        "#{construct_name}"
      end
    end

    class RenderPersonInverseTag < PersonBaseTag
      include PersonInverseNameTrait
      include AffiliationsTrait

      def render(context)
        super(context)
        "#{construct_name} (#{construct_affiliation(context)})"
      end
    end

    class RenderPersonShortInverseTag < PersonBaseTag
      include PersonInverseNameTrait

      def render(context)
        super(context)
        "#{construct_name}"
      end
    end
  end
end

Liquid::Template.register_tag('person', Jekyll::Tags::RenderPersonTag)
Liquid::Template.register_tag('person_inverse', Jekyll::Tags::RenderPersonInverseTag)
Liquid::Template.register_tag('person_noaffi', Jekyll::Tags::RenderPersonShortTag)
Liquid::Template.register_tag('person_noaffi_inverse', Jekyll::Tags::RenderPersonShortInverseTag)
