require 'rails_helper'

RSpec.describe 'User Facade' do
  it 'gets one user' do
    response = UserFacade.user_by_email('bob@bb.com')

    expect(response).to be_a(User)
  end

  it 'finds farms' do
    response = UserFacade.farms

    expect(response.first).to be_a(Farm)
  end

  it 'gets step-by-step driving directions' do
    user1 = UserFacade.user_by_email('bob@bb.com')
    user2 = UserFacade.user_by_email('Jane@jj.com')

    response = UserFacade.driving_directions(user1, user2)

    expect(response).to be_an(Array)
    expect(response.first).to eq('Start out going west on W 72nd Pl toward N Depew St.')
  end
end
