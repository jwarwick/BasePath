task :build_db do
  ruby 'config/build_db.rb'
end

task :get_games do
  ruby 'config/get_games.rb'
end

require 'DataStructures.rb'
task :al_east do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
  Division.al_east.teams.each do |team|
    puts "#{team.city} #{team.name}"
  end
end

task :nl_central do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
  Division.nl_central.teams.each do |team|
    puts "#{team.city} #{team.name}"
  end
end