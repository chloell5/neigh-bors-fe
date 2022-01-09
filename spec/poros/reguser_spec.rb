require 'rails_helper'

RSpec.describe Reguser do
  let(:data) do
    {
        "id": "1",
        "type": "user",
        "attributes": {
            "name": "Bob Smith",
            "email": "bob@bb.com",
            "phone": "123-4567",
            "is_available_for_missions?": false,
            "rescuer_trailer_capacity": 0,
            "address": "5598 W 72nd Pl, Arvada, CO 80003"
        }
    }
  end

  let(:user) { Reguser.new(data) }

  it 'exists with attributes' do
    expect(user).to be_a(Reguser)

    expect(user.name).to eq('Bob Smith')
    expect(user.email).to eq('bob@bb.com')
    expect(user.phone).to eq('123-4567')
    expect(user.available).to eq(false)
    expect(user.trailer_capacity).to eq(0)
    expect(user.address).to eq('5598 W 72nd Pl, Arvada, CO 80003')
  end

  it 'finds a users farm' do
    @farm = {
              "id": "1",
              "type": "farm",
              "attributes": {
                  "name": "Hillsdale Farm",
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
