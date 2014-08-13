require 'spec_helper'

describe Insurance do

  it "is initialized with an instance of a Insurance" do
    new_insurance = Insurance.new("MMM Brains Insurance")
    expect(new_insurance.name).to eq "MMM Brains Insurance"
  end
end
