require 'rails_helper'

RSpec.describe 'Mission Facade' do
  it 'gets one mission by id' do
    evacuee = UserFacade.user_by_email('phmedlin@gmail.com')
    rescuer = UserFacade.user_by_email('mdodson55@gmail.com')
    response = MissionFacade.mission_search(3)

    expect(response.evacuee_id).to eq(evacuee.id.to_i)
    expect(response.rescuer_id).to eq(rescuer.id.to_i)
  end

  it 'gets all missions' do
    response = MissionFacade.all_missions

    expect(response.count).to eq(5)
    expect(response.last.rescuer_id).to eq(5)
  end

  it 'shows distance between locations' do
    evacuee = UserFacade.user_by_email('phmedlin@gmail.com')
    rescuer = UserFacade.user_by_email('mdodson55@gmail.com')

    result = MissionFacade.distance(rescuer, evacuee)

    expect(result).to eq(2.31)
  end

  it 'shows rescuers near mission' do
    mission = MissionFacade.mission_search(2)
    response = MissionFacade.rescuers_near_mission(mission)

    expect(response.count).to eq(4)
    expect(response.first.trailer_capacity).to eq(10)
  end

  it 'shows missions near resucer' do
    rescuer = UserFacade.user_by_email('lesleyasanders@gmail.com')

    result = MissionFacade.missions_near_rescuer(rescuer)

    expect(result.count).to eq(1)
    expect(result.first.id).to eq(2)
  end

  it 'gets step-by-step driving directions' do
    user2 = UserFacade.user_by_email('phmedlin@gmail.com')
    user1 = UserFacade.user_by_email('mdodson55@gmail.com')

    response = MissionFacade.driving_directions(user1, user2)

    expect(response).to be_an(Array)
    expect(response.first).to eq('Start out going north on Madison St toward 2nd St.')
  end
end
