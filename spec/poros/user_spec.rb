require 'rails_helper'

RSpec.describe User do
  let(:data) do
    {
          "id": "1",
          "type": "user",
          "attributes": {
              "name": "Didi Dodson",
              "email": "mdodson55@gmail.com",
              "phone": "1234567",
              "is_available_for_missions?": true,
              "rescuer_trailer_capacity": 5,
              "address": "123 something street"
          }
      }
  end

  let(:user) { User.new(data) }

  it 'exists with attributes' do
    expect(user).to be_a(User)

    expect(user.name).to eq('Didi Dodson')
    expect(user.email).to eq('mdodson55@gmail.com')
    expect(user.phone).to eq('1234567')
    expect(user.available).to eq(true)
    expect(user.trailer_capacity).to eq(5)
    expect(user.address).to eq('123 something street')
  end

  it 'finds a users farm' do
    @farm = {
              "id": "1",
              "type": "farm",
              "attributes": {
                  "name": "Hillsdale Farms",
                  "address": "5598 W 72nd Pl, Arvada, CO 80003",
                  "number_of_animals": 3,
                  "special_needs?": false,
                  "special_needs_details": "n/a",
                  "user_id": 1
              }
          }

    expect(user.farm.name).to eq(@farm[:attributes][:name])
    expect(user.farm.address).to eq(@farm[:attributes][:address])
    expect(user.farm.user_id).to eq(@farm[:attributes][:user_id])
  end
end
