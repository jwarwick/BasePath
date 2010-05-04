require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Team
  include DataMapper::Resource
  
  property :id,           Serial
  property :name,         String
end

DataMapper.auto_upgrade!

get '/?' do
  haml :index
end
