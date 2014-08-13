require 'pg'

class Insurance
  attr_reader :name

  def initialize(name)
    @name = name

  end
end
