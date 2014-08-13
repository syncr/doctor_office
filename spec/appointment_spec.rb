require 'spec_helper'

describe Patient do
  it "is initialized with an instance of an Appointment" do
    new_appointment = Appointment.new("2021-02-01", 534)
    expect(new_appointment.date).to eq "2021-02-01"
    expect(new_appointment.cost).to eq 534
  end
end
