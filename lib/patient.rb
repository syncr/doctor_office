require 'pg'

class Patient
  attr_reader :name, :birthdate, :doctor_id
  def initialize(name, birthdate, doctor_id)
    @name = name
    @birthdate = birthdate
    @doctor_id = doctor_id
  end
end
