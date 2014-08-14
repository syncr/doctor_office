require 'spec_helper'

describe Appointment do
  it "is initialized with an instance of an Appointment" do
    new_appointment = Appointment.new({:patient_id => 1, :doctor_id => 10, :date => "2021-02-01", :cost => 200})
    expect(new_appointment).to be_an_instance_of Appointment
    expect(new_appointment.date).to eq "2021-02-01"
    expect(new_appointment.cost).to eq 200
    expect(new_appointment.doctor_id).to eq 10
    expect(new_appointment.patient_id).to eq 1
  end

  it "stores Appointment in DB" do
    new_doc1 = Doctor.new({:name => "Dr. Zombie", :specialty =>"Brains", :insurance => "MMM Brains Insurance"})
    new_patient1 = Patient.new({:name => "Betty Big Brain", :birthdate =>'1980-11-11'})
    new_appointment = Appointment.new({:patient_id => 1, :doctor_id => 10, :date => "2021-02-01", :cost => 200})


    Doctor.store_db(new_doc1.name, new_doc1.specialty, new_doc1.insurance, new_doc1.max_clients)
    Patient.store_db(new_patient1.name, new_patient1.birthdate, new_patient1.doctor_id)
    Appointment.store_db(new_appointment.patient_id, new_appointment.doctor_id, new_appointment.date, new_appointment.cost)

    expect(new_appointment).to be_an_instance_of Appointment
    expect(DB.exec("SELECT cost FROM appointments;").first['cost']).to eq "200"
  end
end
