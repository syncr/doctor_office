require 'pg'

class Appointment
  attr_accessor :doctor_id, :patient_id, :date, :cost
  def initialize(attributes)
    @patient_id = attributes[:patient_id] || 0
    @doctor_id = attributes[:doctor_id] || 0
    @date = attributes[:date]
    @cost = attributes[:cost]
  end

  def self.date
    @date
  end

  def self.cost
    @cost
  end

  def self.store_db(doctor, patient, date, cost)
    DB.exec("INSERT INTO appointments (doctor_id, patient_id, date, cost) VALUES (#{doctor}, #{patient}, '#{date}', #{cost});")
  end
end
