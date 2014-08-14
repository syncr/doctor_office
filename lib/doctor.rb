require 'pg'

class Doctor
  attr_accessor :name, :specialty, :insurance, :max_clients

  def initialize(attributes)
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
      name = doctor['name']
      specialty = doctor['specialty']
      insurance = doctor['insurance']
      max_clients = doctor['max_clients']
      doctors << self.new({:name => name, :specialty => specialty, :insurance => insurance, :max_clients => max_clients})
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
end
