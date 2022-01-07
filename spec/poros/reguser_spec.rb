require 'rails_helper'

RSpec.describe Reguser do
  let(:data) do
    {
        "id": "1",
        "type": "user",
        "attributes": {
            "name": "Bob",
            "email": "bob@bb.com",
            "phone": '123-456-7890',
            "is_available_for_missions?": false,
            "rescuer_trailer_capacity": 0
        }
    }
  end

  let(:user) { Reguser.new(data) }

  it 'exists with attributes' do
    expect(user).to be_a(Reguser)

    expect(user.name).to eq('Bob')
    expect(user.email).to eq('bob@bb.com')
  end
end
