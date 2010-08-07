class League
  include DataMapper::Resource
  
  property :id,     Serial
  property :name,   String, :required => true
  property :abbrev, String, :required => true

  has n, :divisions
end

class Division
  include DataMapper::Resource
  
  property :id,   Serial
  property :name, String, :required => true

  belongs_to :league
  has n, :teams
end

class Team
  include DataMapper::Resource
  
  property :id,     Serial
  property :city,   String, :required => true
  property :name,   String, :required => true
  #property :league,       String
  #property :division,     String
  property :abbrev, String, :required => true
  
  belongs_to :division
end

DataMapper.finalize

