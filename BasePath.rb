require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'DataStructures'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
DataMapper.auto_upgrade!

get '/?' do
  haml :index
end
