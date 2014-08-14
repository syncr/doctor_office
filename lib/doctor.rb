require 'pg'

class Doctor
  attr_accessor :id, :name, :specialty, :insurance, :max_clients

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @insurance = attributes[:insurance]
    @max_clients = attributes[:max_clients] || 0
  end

  def self.store_db(name, specialty, insurance, max_clients)
    DB.exec("INSERT INTO doctors (name, specialty, insurance, max_clients) VALUES ('#{name}', '#{specialty}', '#{insurance}', #{max_clients});")
  end

  def self.all
    db_entry = DB.exec("SELECT * FROM doctors;")
    doctors = []
    db_entry.each do |doctor|
      id = doctor['id']
      name = doctor['name']
      specialty = doctor['specialty']
      insurance = doctor['insurance']
      max_clients = doctor['max_clients']
      doctors << self.new({:id => id, :name => name, :specialty => specialty, :insurance => insurance, :max_clients => max_clients})
    end
    doctors
  end

  def self.names
    doctors = self.all
    names = []
    doctors.each do |doctor|
      names << doctor.name
    end
    names
  end

  def self.getID(doctor)
    DB.exec("SELECT id FROM doctors WHERE name ='#{doctor}';").first['id']
  end

  def self.table
    self.all.each do |doctor|

      p doctor.name + " has " << DB.exec("SELECT COUNT(id) FROM patients WHERE doctor_id = '#{doctor.id}';").first['count'] + " patients."
    end
  end

end



