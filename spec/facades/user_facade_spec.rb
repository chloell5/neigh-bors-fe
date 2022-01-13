require 'rails_helper'

RSpec.describe 'User Facade' do
  it 'gets all users' do
    response = UserFacade.all_users

    expect(response.count).to eq(6)
  end

  it 'gets one user by email' do
    response = UserFacade.user_by_email('mdodson55@gmail.com')

    expect(response).to be_a(User)
  end

  it 'creates a new user' do
    user_data = {
                  name: "Sally",
                  email: "sallybrown22@gmail.com",
                  phone: "555-555-5556",
                  address: "801 Hudson Street Hoboken, NJ 07030"
                }

    response = UserFacade.create_user(user_data)
    expect(response).to be_a(User)
    expect(response.name).to eq("Sally")

    user_id = response.id.to_i

    farm = FarmFacade.farm_create({
            name: "Sally's Donkeys",
            number_of_animals: 12,
            address: '801 Hudson Street Hoboken, NJ 07030',
            special_needs?: false}, user_id)

    user_data2 = {
                  name: "Sally Brown",
                  email: "sallybrown22@gmail.com",
                  phone: "555-555-5557",
                  address: "801 Hudson Street Hoboken, NJ 07030"
                }
    response = UserFacade.update_user(user_data2, user_id)[:data]

    expect(response[:attributes][:name]).to eq("Sally Brown")
  end

  it 'finds one user by id' do
    user_id = 3
    response = UserFacade.find_by_id(user_id)

    expect(response).to be_a(User)
  end
end
