require 'rails_helper'

RSpec.describe 'Mission Facade' do
  it 'gets one mission' do
    evacuee = UserFacade.user_by_email('phmedlin@gmail.com')
    rescuer = UserFacade.user_by_email('mdodson55@gmail.com')
    response = MissionFacade.mission_search(3)

    expect(response.evacuee_id).to eq(evacuee.id.to_i)
    expect(response.rescuer_id).to eq(rescuer.id.to_i)
  end

  it 'gets step-by-step driving directions' do
    user2 = UserFacade.user_by_email('phmedlin@gmail.com')
    user1 = UserFacade.user_by_email('mdodson55@gmail.com')

    response = MissionFacade.driving_directions(user1, user2)

    expect(response).to be_an(Array)
    expect(response.first).to eq('Start out going north on Madison St toward 2nd St.')
  end
end
