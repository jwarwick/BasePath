require 'rubygems'
#require 'gameday_api'
require 'team' # from gameday_api

team = Team.new('bos')
games = team.all_games('2010')
#games = team.get_games_for_month('4', '2010')

if games
  games.each do |game|
    if game == nil
      puts "Game is nil"
      next
    end
    finished = game.finished? ? "Finished" : "Not Finished"
    date = game.month.to_s + "/" + game.day.to_s + "/" + game.year.to_s
    puts "#{game.visit_team_name} vs #{game.home_team_name}, #{date} - #{finished}, winner: #{game.get_winner}, #{game.get_away_runs}-#{game.get_home_runs}"
  end
end
