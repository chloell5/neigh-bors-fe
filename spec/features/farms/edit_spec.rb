require 'rails_helper'

RSpec.describe 'Farm Edit' do
  before do
    @user = UserFacade.user_by_email('mdodson55@gmail.com')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @farm = FarmFacade.find_farm(@user.id)
  end

  it 'can edit an existing farm' do
    visit farms_edit_path

    fill_in :name, with: "Hope this passes"

    click_button "Submit"

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content("Hope this passes")

    visit farms_edit_path

    fill_in :name, with: "Didi's Horse Retreat"

    click_button "Submit"
  end
end
