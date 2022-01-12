require 'rails_helper'

RSpec.describe 'User Facade' do
  it 'gets one user' do
    response = UserFacade.user_by_email('mdodson55@gmail.com')

    expect(response).to be_a(User)
  end
end
