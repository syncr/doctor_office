require 'pg'


class Doctor
  attr_accessor :name, :specialty, :insurance, :max_clients

  def initialize(attributes)
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @insurance = attributes[:insurance]
    @max_clients = attributes[:max_clients]
  end

  def self.add_doctor_db(name, specialty, insurance, max_clients)

    # DB.exec("INSERT INTO doctors (name, specialty, insurance, max_clients) VALUES ('#{@name}', '#{@specialty}', '#{@insurance}', #{@max_clients});")
    DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}');")
    p name
    p "#{@name}"

    # DB.exec("INSERT INTO tasks   (name, list_id, due_date)                 VALUES ('#{@name}', #{@list_id}, '#{@due_date}');")
  end
end
