require 'rails_helper'

RSpec.describe 'Mission Show' do
  it 'shows farm rescue info' do
    evacuee = UserFacade.user_by_email('bob@bb.com')
    rescuer = UserFacade.user_by_email('Jane@jj.com')
    directions = UserFacade.driving_directions(rescuer, evacuee).join(', ')

    mission = MissionFacade.mission_search(1)

    visit mission_show_path(mission.id)

    expect(page).to have_content(directions.first)
  end
end
