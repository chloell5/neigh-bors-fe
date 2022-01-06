require 'rails_helper'

RSpec.describe 'Welcome' do
  it 'shows the title' do
    visit root_path

    expect(page.find('#title-img')['src']).to have_content('neighbors-cover.jpg')
  end

  it 'links to the Login page' do
    visit root_path

    click_button 'Login'

    expect(current_path).to eq(login_path)
  end

  it 'links to the registration page' do
    visit root_path

    click_button 'Register'

    expect(current_path).to eq(register_path)
  end

  it 'links to the resources page' do
    visit root_path

    click_link 'Resources'

    expect(current_path).to eq(resources_path)
  end
end
