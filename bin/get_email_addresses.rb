#!/usr/bin/env ruby
=begin
coding: UTF-8
:markup: RDoc
:title: Get EMail Addresses of all JLESCees

= EMail Address Printer

== About
This script prints out the email addresses of all JLESCees in '_data/people.yml'.

== Usage
You must run this script from the source directory of the JLESC site, i.e. the parent of the
directory this script is in.
Given you have loaded the correct Ruby environment for the JLESC site
(cf. {Testing Locally on the JLESC Webpage Wiki}[https://github.com/JLESC/jlesc.github.io/wiki/Testing-Locally]).
Then simply run it from the command line:

    bundle exec ./bin/get_email_addresses.rb

The script will print out a bunch of diagnostics and finally, on its last line, the comma separated
list of email addresses, where each element has the form

    "Surnames, Given Names" <email>

If you want to pipe the list of email addresses directly into your email client, pipe the output
through `tail` to get the last line:

    bundle exec ./bin/get_email_addresses.rb | tail -1
=end

require 'bundler/setup'
Bundler.require(:default)
require 'jekyll'

module JLESC
  class EMailAddressPrinter
    class << self
      def process
        @printer = JLESC::EMailAddressPrinter.new
        @printer.run
      end
    end

    def initialize
      @site = Jekyll::Site.new(Jekyll::Command.configuration_from_options({serving: false}))
    end

    def run
      @site.reset
      @site.read

      emails = []

      @site.data['people'].each_pair do |person_id,person|
        unless person['email']
          puts "WARNING: '#{construct_person_name(person)}' has no email address given."
          next
        end

        # emails << "\"#{construct_person_name(person)}\" <#{person['email']}>"
        emails << "#{person['email']}"
      end

      puts ''
      puts "#{emails.length} out of #{@site.data['people'].length} people have an email address given."
      puts ''

      puts 'List of email addresses:'
      puts '---'
      puts emails.join(', ')
    end

    private
    def construct_person_name(person)
      "#{person['sur_name']}, #{person['given_name']}"
    end
  end
end

JLESC::EMailAddressPrinter.process
