require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'DataStructures'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
DataMapper.auto_upgrade!

get '/?' do
  @teams = Team.all(:order => [:league.asc, :division.asc])

  #@teams = Team.all(:league => 'al', :division => 'west') 

  haml :index
end
