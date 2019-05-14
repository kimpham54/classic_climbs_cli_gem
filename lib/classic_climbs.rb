module ClassicClimbs
  class Error < StandardError; end
  # Your code goes here...
end


# this needs to come afterwards or else you get an uninitialized constant error for ClassicClimbs
require_relative '../config/environment'