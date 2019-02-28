require 'countries'
ISO3166.configuration.enable_currency_extension!
require './report'
require './email'

puts "What country do you want a report on?"

country_name = gets.strip

country = ISO3166::Country
            .find_country_by_name(country_name)

if country
  Report.new(country).run
  puts "Where should we email the report?"
  email_address = gets.strip
  Email.new(email_address, country).deliver
else
  puts "Could not find a country called #{country_name}"
end
