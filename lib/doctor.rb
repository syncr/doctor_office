require 'pg'


class Doctor
  attr_reader :name, :specialty, :insurance, :max_clients

  def initialize(attributes)
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @insurance = attributes[:insurance]
    @max_clients = attributes[:max_clients]
  end


end
