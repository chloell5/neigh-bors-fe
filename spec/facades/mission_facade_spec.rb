require 'rails_helper'

RSpec.describe 'Mission Facade' do
  it 'gets one mission' do
    evacuee = UserFacade.user_by_email('phmedlin@gmail.com')
    rescuer = UserFacade.user_by_email('mdodson55@gmail.com')
    response = MissionFacade.mission_search(3)

    expect(response.evacuee_id).to eq(evacuee.id.to_i)
    expect(response.rescuer_id).to eq(rescuer.id.to_i)
  end
end
