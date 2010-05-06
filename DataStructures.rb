class TeamEntry
  include DataMapper::Resource
  
  property :id,           Serial
  property :city,         String
  property :name,         String
  property :league,       String
  property :division,     String
  property :abbrev,       String
  
end
