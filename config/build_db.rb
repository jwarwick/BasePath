require 'rubygems'
#require 'dm-core'
require 'dm-migrations'
require 'DataStructures.rb'
require 'yaml'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
DataMapper.auto_migrate!

def create_division(name, league)
  d = Division.create(:name => name, :league => league)
  d.saved? or abort "Error creating #{league.name} #{name}"
end

# Create the leagues and Divisions
al = League.create(:name => 'American League', :abbrev => 'al')
al.saved? or abort "Error creating American League"

create_division("east", al)
create_division("west", al)
create_division("central", al)

nl = League.create(:name => 'National League', :abbrev => 'nl')
nl.saved? or abort "Error creating National League"

create_division("east", nl)
create_division("west", nl)
create_division("central", nl)

yml = YAML.load_file 'config/teams.yaml'
yml.each do |item|
  city = item['city']
  name = item['name']
  league = item['league']
  division = item['division']
  abbrev = item['abbrev']
  puts "Adding: #{city}, #{name}, #{league}, #{division}, #{abbrev}"
  
  l = League.first(:abbrev => league)
  d = l.divisions.first(:name => division)
  
  team = Team.new(
    :city => city,
    :name => name,
    :abbrev => abbrev,
    :division => d
  )
  team.save or abort "Error saving team"
end

