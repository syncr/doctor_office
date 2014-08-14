require 'pg'
require 'pry'

class Patient
  attr_accessor :name, :birthdate, :doctor_id

  def initialize(attributes)
    @name = attributes[:name]
    @birthdate = attributes[:birthdate]
    @doctor_id = attributes[:doctor_id] || 0
  end


  def self.store_db(name, birthdate, doctor_id)
    DB.exec("INSERT INTO patients (name, birthdate, doctor_id) VALUES ('#{name}', '#{birthdate}', '#{doctor_id}');")
  end

  def self.list_patient_db
    patients = DB.exec("SELECT name FROM patients;")
    names = []
    patients.each do |patient|
      names << patient['name']
    end
    names
  end

  def self.getID(patient)
    DB.exec("SELECT id FROM patients WHERE name ='#{patient}';").first['id']
  end
end
