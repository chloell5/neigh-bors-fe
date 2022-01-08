require 'rails_helper'

RSpec.describe Farm do
  let(:data) do
    {
      "id": "1",
      "type": "farm",
      "attributes": {
          "name": "Hillsdale Farm",
          "address": "123 Street",
          "number_of_animals": 3,
          "special_needs?": false,
          "special_needs_details": "n/a",
          "user_id": 1
      }}
  end

  let(:farm) { Farm.new(data) }

  it 'exists with attributes' do
    expect(farm).to be_a(Farm)

    expect(farm.name).to eq('Hillsdale Farm')
    expect(farm.address).to eq('123 Street')
    expect(farm.animals).to eq(3)
    expect(farm.special_needs).to eq(false)
    expect(farm.special_needs_details).to eq('n/a')
    expect(farm.user_id).to eq(1)
  end
end
