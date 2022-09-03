require 'rails_helper'

RSpec.describe Truck, type: :model do
  it "must have a non blank name" do
    truck = Truck.new(name: 'João')

    expect(truck).to be_valid
  end
end
