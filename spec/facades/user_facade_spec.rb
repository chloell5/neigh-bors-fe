require 'rails_helper'

RSpec.describe 'User Facade' do
  it 'gets all users' do
    response = UserFacade.all_users

    expect(response.count).to eq(5)
  end

  it 'gets one user by email' do
    response = UserFacade.user_by_email('mdodson55@gmail.com')

    expect(response).to be_a(User)
  end

  xit 'creates a new user' do
    user_id = 15
    user_data = {
                  name: "Sally",
                  email: "sallybrown22@gmail.com",
                  phone: "555-555-5555",
                  is_available_for_missions?: true,
                  rescuer_trailer_capacity: 10,
                  address: "801 Hudson Street Hoboken, NJ 07030"
                }

    response = UserFacade.create_user(user_data)

    expect(response).to be_a(User)
    expect(response.name).to eq("Sally")
    expect(response.address).to eq("801 Hudson Street Hoboken, NJ 07030")
  end

  xit 'updates a user' do
    user_id = 15
    user_data = {
                  name: "Sally",
                  email: "sallybrown22@gmail.com",
                  phone: "555-555-5555",
                  is_available_for_missions?: true,
                  rescuer_trailer_capacity: 15,
                  address: "801 Hudson Street Hoboken, NJ 07030"
                }
    response = UserFacade.update_user(user_data, user_id)

    expect(response[:attributes][:rescuer_trailer_capacity]).to eq(15)
  end

  it 'finds one user by id' do
    user_id = 3
    response = UserFacade.find_by_id(user_id)

    expect(response).to be_a(User)
  end
end
