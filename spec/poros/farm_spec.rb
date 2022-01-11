require 'rails_helper'

RSpec.describe Farm do
  let(:data) do
    {
            "id": "3",
            "type": "farm",
            "attributes": {
                "name": "Didi's Horse Retreat",
                "address": "111 Madison Street Hoboken, NJ 07030",
                "number_of_animals": 10,
                "special_needs?": false,
                "special_needs_details": "None",
                "user_id": 3
            }
        }
  end

  let(:farm) { Farm.new(data) }

  it 'exists with attributes' do
    expect(farm).to be_a(Farm)

    expect(farm.name).to eq("Didi's Horse Retreat")
    expect(farm.address).to eq("111 Madison Street Hoboken, NJ 07030")
    expect(farm.animals).to eq(10)
    expect(farm.special_needs).to eq(false)
    expect(farm.special_needs_details).to eq('None')
    expect(farm.user_id).to eq(3)
  end
end
