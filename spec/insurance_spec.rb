require 'spec_helper'

describe Insurance do

  it "is initialized with an instance of a Insurance" do
    new_insurance = Insurance.new({:name => "MMM Brains Insurance"})
    expect(new_insurance).to be_an_instance_of Insurance
    expect(new_insurance.name).to eq "MMM Brains Insurance"
  end
end
