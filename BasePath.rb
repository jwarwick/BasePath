require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'DataStructures'
require 'team'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
DataMapper.auto_upgrade!

get '/?' do
  @teams = TeamEntry.all(:order => [:league.asc, :division.asc])
  #@teams = Team.all(:league => 'al', :division => 'west') 

=begin
  team = Team.new('bos')
  games = team.all_games('2010')
  games.each do |game|
    puts "#{game.visit_team_name} vs #{game.home_team_name}"
  end
=end

  haml :index
end
