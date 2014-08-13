require 'spec_helper'

describe Doctor do

  it "is initialized with an instance of a Doctor" do
    new_doc = Doctor.new({:name => "Dr. Zombie", :specialty =>"Brains", :insurance => "MMM Brains Insurance"})
    expect(new_doc).to be_an_instance_of Doctor
    expect(new_doc.name).to eq "Dr. Zombie"
    expect(new_doc.specialty).to eq "Brains"
    expect(new_doc.insurance).to eq "MMM Brains Insurance"
    expect(new_doc.max_clients).to eq nil
  end
end
