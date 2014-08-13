require 'pg'

class Appointment
  attr_reader :doctor_id, :patient_id, :date, :cost
  def initialize(attributes)
    @patient_id = attributes[:patient_id]
    @doctor_id = attributes[:doctor_id]
    @date = attributes[:date]
    @cost = attributes[:cost]
  end
end
