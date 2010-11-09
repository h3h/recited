require 'active_support/time'
require 'recited'

# override Date.today
class Date
  class << self
    def today
      Date.new(2010, 11, 9)
    end
  end
end
