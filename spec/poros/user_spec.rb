require 'rails_helper'

RSpec.describe User do
  let(:data) do
    {
        "id": "3",
        "type": "user",
        "attributes": {
            "name": "Didi",
            "email": "mdodson55@gmail.com",
            "phone": "555-555-5555",
            "is_available_for_missions?": true,
            "rescuer_trailer_capacity": 10,
            "address": "111 Madison Street Hoboken, NJ 07030"
        }
    }
  end

  let(:user) { User.new(data) }

  it 'exists with attributes' do
    expect(user).to be_a(User)

    expect(user.name).to eq('Didi')
    expect(user.email).to eq('mdodson55@gmail.com')
    expect(user.phone).to eq('555-555-5555')
    expect(user.available).to eq(true)
    expect(user.trailer_capacity).to eq(10)
    expect(user.address).to eq('111 Madison Street Hoboken, NJ 07030')
  end

  it 'finds a users farm' do
    @farm = {
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

    expect(user.farm.name).to eq(@farm[:attributes][:name])
    expect(user.farm.address).to eq(@farm[:attributes][:address])
    expect(user.farm.user_id).to eq(@farm[:attributes][:user_id])
  end
end
