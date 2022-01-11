require 'rails_helper'

RSpec.describe Mission do
  let(:data) do
    {
        "id": "1",
        "type": "mission",
        "attributes": {
            "user_id": 3,
            "farm_id": 4
        }
    }
  end

  let(:mission) { Mission.new(data) }

  it 'exists with attributes' do
    expect(mission).to be_a(Mission)
    expect(mission.rescuer_id).to eq(3)
    expect(mission.evacuee_id).to eq(4)
  end
end
