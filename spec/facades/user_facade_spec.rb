require 'rails_helper'

RSpec.describe 'User Facade' do
  it 'gets one user' do
    response = UserFacade.user_by_email('mdodson55@gmail.com')

    expect(response).to be_a(User)
  end

  it 'gets step-by-step driving directions' do
    user2 = UserFacade.user_by_email('phmedlin@gmail.com')
    user1 = UserFacade.user_by_email('mdodson55@gmail.com')

    response = UserFacade.driving_directions(user1, user2)

    expect(response).to be_an(Array)
    expect(response.first).to eq('Start out going north on Madison St toward 2nd St.')
  end
end
