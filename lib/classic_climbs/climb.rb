# refactoring options
# 1. add :location, make a location class
# 2. make a grade class

class ClassicClimbs::Climb
attr_accessor :name, :grade, :type, :firstascent, :url, :description

@@all = []

def initialize(climb)
	climb.each do |key, value|
      self.send("#{key}=", value)
  end
  @@all << self
end

# creates climb instances from an array of climb hashes, meant to take from ClassicClimbs::Scraper.all, calls on initialize to do write attributes
def self.create_climb(climbs_array)
	climbs_array.each do |climb_hash|
		self.new(climb_hash)
	end
end

 def self.find(id)
    self.all[id-1]
  end


def self.all
	@@all
end

def self.reset
	self.all.clear
end

end