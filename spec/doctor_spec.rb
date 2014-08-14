require 'spec_helper'

describe Doctor do

  it "is initialized with an instance of a Doctor" do
    new_doc = Doctor.new({:name => "Dr. Zombie", :specialty =>"Brains", :insurance => "MMM Brains Insurance"})
    expect(new_doc).to be_an_instance_of Doctor
    expect(new_doc.name).to eq "Dr. Zombie"
    expect(new_doc.specialty).to eq "Brains"
    expect(new_doc.insurance).to eq "MMM Brains Insurance"
    expect(new_doc.max_clients).to eq 0
  end

  it "stores an instance of a Doctor to the DB" do
    new_doc = Doctor.new({:name => "Dr. Zombie", :specialty =>"Brains", :insurance => "MMM Brains Insurance"})
    Doctor.store_db(new_doc.name, new_doc.specialty, new_doc.insurance, new_doc.max_clients)
    expect(DB.exec("SELECT * FROM doctors;").first['name']).to eq "Dr. Zombie"
  end

  it "lists all the doctors that are stored in the DB" do
    new_doc1 = Doctor.new({:name => "Dr. Zombie", :specialty =>"Brains", :insurance => "MMM Brains Insurance"})
    new_doc2 = Doctor.new({:name => "Dr. Death", :specialty =>"Eyes", :insurance => "MMM Brains Insurance"})
    new_doc3 = Doctor.new({:name => "Dr. Aaaaggghh", :specialty =>"Blood and Tears", :insurance => "Specialty Death Inc."})
    Doctor.store_db(new_doc1.name, new_doc1.specialty, new_doc1.insurance, new_doc1.max_clients)
    Doctor.store_db(new_doc2.name, new_doc2.specialty, new_doc2.insurance, new_doc2.max_clients)
    Doctor.store_db(new_doc3.name, new_doc3.specialty, new_doc3.insurance, new_doc3.max_clients)

    expect(Doctor.names).to eq (["Dr. Zombie", "Dr. Death", "Dr. Aaaaggghh"])
  end

end
