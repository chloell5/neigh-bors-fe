require 'rails_helper'

RSpec.describe 'User Registration' do
  # before do
    # user = UserFacade.user_by_email('me@gmail.com')
  #   allow_any_instance_of(ApplicationController)
  #   .to receive(:current_user) #.and_return(user)
  # end

  it 'title' do
    user = UserFacade.create_user(
        {
          name: 'Charlie Brown',
          email: 'Charliebrown45@gmail.com',
          address: 'default_address',
          phone: 'default_phone'
        })

    session[:user_id] = user.id
    visit users_register_path

    expect(page).to have_content("Tell us about yourself")
  end

  xit 'form' do
    visit users_register_path

    expect(page).to have_content("Name")
    expect(page).to have_field(:name)
    expect(page).to have_content("Address")
    expect(page).to have_field(:address)
    expect(page).to have_content("Phone Number")
    expect(page).to have_field(:phone)
    expect(page).to have_content("How many horses")
    expect(page).to have_field(:trailer_capacity)
    expect(page).to have_content("Are you available")
    expect(page).to have_radio_button(:available_for_missions?)
  end

  xit 'buttons' do
    visit users_register_path

    expect(page).to have_radio_button(:available_for_missions?)
    expect(page).to have_button("Register")
  end
end