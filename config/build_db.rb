require 'rubygems'
require 'dm-core'
require 'DataStructures.rb'
require 'yaml'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
DataMapper.auto_upgrade!

yml = YAML.load_file 'config/teams.yaml'
yml.each do |item|
  city = item['city']
  name = item['name']
  league = item['league']
  division = item['division']
  abbrev = item['abbrev']
  puts "Adding: #{city}, #{name}, #{league}, #{division}, #{abbrev}"
  team = TeamEntry.new(
    :city => city,
    :name => name,
    :league => league,
    :division => division,
    :abbrev => abbrev
  )
  puts "Error saving team" unless team.save
end