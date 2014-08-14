require 'spec_helper'

describe Patient do
  it "is initialized with an instance of a Patient" do
    new_patient = Patient.new({:name => "Betty Big Brain", :birthdate =>'1980-11-11'})
    expect(new_patient).to be_an_instance_of Patient
    expect(new_patient.name).to eq "Betty Big Brain"
    expect(new_patient.birthdate).to eq ('1980-11-11')
    expect(new_patient.doctor_id).to eq 0
  end

  it "is stores Patient data to DB" do
    new_patient = Patient.new({:name => "Betty Big Brain", :birthdate =>'1980-11-11'})
    Patient.store_db(new_patient.name, new_patient.birthdate, new_patient.doctor_id)
    expect(DB.exec("SELECT * FROM patients;").first['name']).to eq "Betty Big Brain"
  end

    it "lists all Patients from data in DB" do
    new_patient1 = Patient.new({:name => "Betty Big Brain", :birthdate =>'1980-11-11'})
    new_patient2 = Patient.new({:name => "Bob Beefy Leg", :birthdate =>'1987-11-11'})
    new_patient3 = Patient.new({:name => "Larry Tasty Arms", :birthdate =>'1995-11-11'})
    Patient.store_db(new_patient1.name, new_patient1.birthdate, new_patient1.doctor_id)
    Patient.store_db(new_patient2.name, new_patient2.birthdate, new_patient2.doctor_id)
    Patient.store_db(new_patient3.name, new_patient3.birthdate, new_patient3.doctor_id)

    expect(DB.exec("SELECT name FROM patients;").first['name']).to eq "Betty Big Brain"
  end

end
