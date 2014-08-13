require 'spec_helper'

describe Appointment do
  it "is initialized with an instance of an Appointment" do
    new_appointment = Appointment.new({:date => "2021-02-01", :cost => 534})
    expect(new_appointment).to be_an_instance_of Appointment
    expect(new_appointment.date).to eq "2021-02-01"
    expect(new_appointment.cost).to eq 534
  end
end
