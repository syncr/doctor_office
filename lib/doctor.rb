require 'pg'


class Doctor
  attr_reader :name, :specialty, :insurance, :max_clients

  def initialize(name, specialty, insurance)
    @name = name
    @specialty = specialty
    @insurance = insurance
    @max_clients = 10
  end


end
