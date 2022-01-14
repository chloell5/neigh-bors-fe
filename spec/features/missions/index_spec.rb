require 'rails_helper'

RSpec.describe 'Mission Index' do
  before do
    @user = UserFacade.user_by_email('sallybrown22@gmail.com')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'shows the name of the farm for each rescue' do
    visit missions_path

    expect(page).to have_content('Didi')
  end

  it 'shows total number of horses' do
    visit missions_path

    expect(page).to have_content('10 horses')
  end

  it 'shows distance to farm' do
    visit missions_path

    expect(page).to have_content('1.33 miles away')
  end
end
