require 'pg'

class Appointment
  attr_reader :doctor_id, :patient_id, :date, :cost
  def initialize(date, cost)
    @patient_id = patient_id
    @doctor_id = doctor_id
    @date = date
    @cost = cost
  end
end
