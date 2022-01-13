require 'rails_helper'

RSpec.describe 'User Facade' do
  it 'gets one user' do
    response = UserFacade.user_by_email('mdodson55@gmail.com')

    expect(response).to be_a(User)
  end

  xit 'creates a new user' do
    user_id = 15
    user_data = {
                  name: "Sally",
                  email: "sallybrown22@gmail.com",
                  phone: "555-555-5555",
                  address: "801 Hudson Street Hoboken, NJ 07030"
                }

    response = UserFacade.create_user(user_data)

    expect(response).to be_a(User)
    expect(response.name).to eq("Sally")
    expect(response.address).to eq("801 Hudson Street Hoboken, NJ 07030")
  end
end
