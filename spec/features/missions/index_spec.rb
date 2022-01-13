require 'rails_helper'

RSpec.describe 'Mission Index' do
  # Should probably fix all the hardcoding
  before do
    @user = UserFacade.user_by_email('mdodson55@gmail.com')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'shows the name of the farm for each rescue' do
    visit missions_path

    expect(page).to have_content('Didi\'s Horse Retreat')
  end

  it 'shows total number of horses' do
    visit missions_path

    expect(page).to have_content('10 horses')
  end

  it 'shows distance to farm' do
    visit missions_path

    expect(page).to have_content('0 miles away')
  end
end
