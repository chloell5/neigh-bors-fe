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

  it 'creates a new user' do
    # Rails.application.env_config["oauth"] = users_register_path # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]

    user = UserFacade.create_user({
                  name: "Sally",
                  email: "sallybrown22@gmail.com",
                  phone: "555-555-5555",
                  address: "801 Hudson Street Hoboken, NJ 07030"
                })

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(user).to be_a(User)
    expect(user.name).to eq("Sally")
    expect(user.address).to eq("801 Hudson Street Hoboken, NJ 07030")
  end

  xit 'updates a user' do
    user_id = 1
    user_data = {
                  name: "Lesley A",
                  email: "lesleyasanders@gmail.com",
                  phone: "444-555-6666",
                  address: "727 Garden Street Hoboken, NJ 07030"
                }
    response = UserFacade.update_user(user_data, user_id)

    expect(response[:attributes][:name]).to eq("Sally A")
  end

  it 'finds one user by id' do
    user_id = 3
    response = UserFacade.find_by_id(user_id)

    expect(response).to be_a(User)
  end
end
