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
end
