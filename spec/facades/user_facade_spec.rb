require 'rails_helper'

RSpec.describe 'User Facade' do
  it 'gets one user' do
    response = UserFacade.user_by_email('bob@bb.com')

    expect(response).to be_a(Reguser)
  end
end
