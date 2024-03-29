require 'rspec'
require 'doctor'
require 'patient'
require 'appointment'
require 'insurance'
require 'pg'

DB = PG.connect({:dbname => 'medical_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM appointments *;")
    DB.exec("DELETE FROM insurance_plans *;")
  end
end

