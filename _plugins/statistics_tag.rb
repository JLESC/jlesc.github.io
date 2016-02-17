module JLESC
  def self.get_stats(site)
    institutes = site.data['institutes']
    positions = site.data['positions']
    people = site.data['people']
    projects = site.collections['projects'].docs

    statistics = {
        'people' => {
            'positions' => {},
        },
        'institutes' => {}
    }

    positions.each_key do |key|
      statistics['people']['positions'][key] = 0
    end

    institutes.each_key do |key|
      statistics['institutes'][key] = {
          'projects' => 0,
          'leading' => 0,
          'people' => 0
      }
    end

    people.each do |id,person|
      if person['affiliation'].is_a? Array
        statistics['institutes'][person['affiliation'].first]['people'] += 1
      else
        statistics['institutes'][person['affiliation']]['people'] += 1
      end

      if statistics['people']['positions'].has_key?(person['position'])
        statistics['people']['positions'][person['position']] += 1
      end

      statistics['people'][id] = {
          'projects' => {
              'leading' => 0,
              'participating' => 0
          }
      }
    end

    projects.each do |project|
      if project.data.has_key?('head')
        head = people[project.data['head']]
        if head['affiliation'].is_a? Array
          statistics['institutes'][head['affiliation'].first]['leading'] += 1
        else
          statistics['institutes'][head['affiliation']]['leading'] += 1
        end
        statistics['people'][project.data['head']]['projects']['leading'] += 1
      end

      inst = []
      if project.data.has_key?('members')
        project.data['members'].each do |member|
          statistics['people'][member]['projects']['participating'] += 1

          if people[member]['affiliation'].is_a? Array
            inst << people[member]['affiliation'].first
          else
            inst << people[member]['affiliation']
          end
        end
      end
      inst.uniq.each do |institute|
        statistics['institutes'][institute]['projects'] += 1
      end
    end

    JLESC.aggregate_ncsa_uiuc(statistics)
  end


  def self.aggregate_ncsa_uiuc(stats)
    stats['institutes']['ncsa'].each_pair do |key,value|
      stats['institutes']['uiuc'][key] += value
      stats['institutes']['ncsa'][key] = stats['institutes']['uiuc'][key]
    end

    stats
  end
end


module Jekyll
  module Tags
    class PartnerStatisticsTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @markup = markup.strip
      end

      def get_stats(context)
        @institute_id = Liquid::Template.parse(@markup).render(context)
        JLESC.get_stats(context.registers[:site])['institutes'][@institute_id]
      end
    end

    class PeopleForPartnerTag < PartnerStatisticsTag
      def render(context)
        get_stats(context)['people']
      end
    end

    class ProjectsForPartnerTag < PartnerStatisticsTag
      def render(context)
        get_stats(context)['projects']
      end
    end

    class LeadingForPartnerTag < PartnerStatisticsTag
      def render(context)
        get_stats(context)['leading']
      end
    end


    class PersonStatisticsTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @markup = markup.strip
      end

      def get_stats(context)
        @person_id = Liquid::Template.parse(@markup).render(context)
        JLESC.get_stats(context.registers[:site])['people'][@person_id]
      end
    end

    class ProjectsForPersonTag < PersonStatisticsTag
      def render(context)
        get_stats(context)['projects']['participating']
      end
    end

    class LeadingForPersonTag < PersonStatisticsTag
      def render(context)
        get_stats(context)['projects']['leading']
      end
    end


    class StatsForPositionTag < Liquid::Tag
      def initialize(tag_name, markup, tokens)
        super
        @markup = markup.strip
      end

      def render(context)
        JLESC.get_stats(context.registers[:site])['people']['positions'][@markup]
      end
    end
  end
end

Liquid::Template.register_tag('people_for_partner', Jekyll::Tags::PeopleForPartnerTag)
Liquid::Template.register_tag('projects_for_partner', Jekyll::Tags::ProjectsForPartnerTag)
Liquid::Template.register_tag('leading_for_partner', Jekyll::Tags::LeadingForPartnerTag)

Liquid::Template.register_tag('projects_for_person', Jekyll::Tags::ProjectsForPersonTag)
Liquid::Template.register_tag('leading_for_person', Jekyll::Tags::LeadingForPersonTag)

Liquid::Template.register_tag('stats_for_position', Jekyll::Tags::StatsForPositionTag)
