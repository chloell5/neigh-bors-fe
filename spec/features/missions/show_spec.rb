require 'rails_helper'

RSpec.describe 'Mission Show' do
  it 'shows farm rescue info' do
    rescuer = UserFacade.user_by_email('mdodson55@gmail.com')
    evacuee = UserFacade.user_by_email('phmedlin@gmail.com')
    directions = MissionFacade.driving_directions(rescuer, evacuee).join(', ')

    mission = MissionFacade.mission_search(3)

    visit mission_show_path(mission.id)

    expect(page).to have_content(directions.first)
  end
end
