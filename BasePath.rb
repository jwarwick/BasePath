require 'rubygems'
require 'sinatra'
require 'haml'
require 'DataStructures'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
#DataMapper.auto_upgrade!

get '/?' do
  @al_east = Division.al_east
  @al_central = Division.al_central
  @al_west = Division.al_west
  @nl_east = Division.nl_east
  @nl_central = Division.nl_central
  @nl_west = Division.nl_west
  
  @divisions = [@al_east, @al_central, @al_west, 
    @nl_east, @nl_central, @nl_west]
  
  #@teams = Team.all
  #@teams = TeamEntry.all(:order => [:league.asc, :division.asc])
  #@teams = Team.all(:league => 'al', :division => 'west') 

=begin
  team = Team.new('bos')
  #games = team.all_games('2010')
  games = team.get_games_for_month('4', '2010')
  games.each do |game|
    puts "#{game.visit_team_name} vs #{game.home_team_name}, #{game.home_runs}-#{game.away_runs}"
  end
=end

  haml :index
end
