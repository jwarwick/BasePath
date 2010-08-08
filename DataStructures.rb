require 'dm-core'

class League
  include DataMapper::Resource
  
  property :id,     Serial
  property :name,   String, :required => true
  property :abbrev, String, :required => true

  has n, :divisions

  def self.al
    first(:abbrev => 'al')
  end

  def self.nl
    first(:abbrev => 'nl')
  end      

end

class Division
  include DataMapper::Resource
  
  property :id,   Serial
  property :name, String, :required => true

  belongs_to :league
  has n, :teams
  
  def self.al_east
    first(:name => 'east', :league => League.al)
  end
  def self.al_central
    first(:name => 'central', :league => League.al)
  end
  def self.al_west
    first(:name => 'west', :league => League.al)
  end
  
  def self.nl_east
    first(:name => 'east', :league => League.nl)
  end
  def self.nl_central
    first(:name => 'central', :league => League.nl)
  end
  def self.nl_west
    first(:name => 'west', :league => League.nl)
  end
  
end

class Team
  include DataMapper::Resource
  
  property :id,     Serial
  property :city,   String, :required => true
  property :name,   String, :required => true
  property :abbrev, String, :required => true
  
  belongs_to :division
end

DataMapper.finalize

