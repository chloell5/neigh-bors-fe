require 'rails_helper'

RSpec.describe 'Mission New' do
  before do
    @user = UserFacade.user_by_email('mdodson55@gmail.com')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @farm = FarmFacade.find_farm(@user.id)
  end
  it 'has farm information' do
    visit missions_new_path

    expect(page).to have_content(@farm.name)
    expect(page).to have_content(@farm.address)
    expect(page).to have_content(@farm.animals)

    expect(page).to have_content(@user.phone)
    expect(page).to have_content(@user.email)
    expect(page).to have_content(@user.trailer_capacity)
  end

  it 'has link to edit page' do
    visit missions_new_path

    click_button 'Edit'

    expect(page).to have_content("#{@farm.name}'s Edit")
  end

  it 'submits when clicked' do
    visit missions_new_path

    click_button 'Submit'

    expect(page).to have_current_path(dashboard_path)
  end
end
