require 'spec_helper'

describe Patient do
  it "is initialized with an instance of a Patient" do
    new_patient = Patient.new({:name => "Betty Big Brain", :birthdate =>'1980-11-11', :doctor_id => 1})
    expect(new_patient).to be_an_instance_of Patient
    expect(new_patient.name).to eq "Betty Big Brain"
    expect(new_patient.birthdate).to eq ('1980-11-11')
    expect(new_patient.doctor_id).to eq 1
  end
end
