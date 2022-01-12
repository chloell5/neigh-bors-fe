require 'rails_helper'

RSpec.describe 'Mission New' do
  before do
    @user = UserFacade.user_by_email('mdodson55@gmail.com')
    @farm = FarmFacade.find_farm(@user.id)
  end
  it 'has farm information' do
    visit missions_new_path
    save_and_open_page
  end

  it 'has link to edit page'
  it 'submits when clicked'
end
