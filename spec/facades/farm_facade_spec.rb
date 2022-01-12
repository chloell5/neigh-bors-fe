require 'rails_helper'

RSpec.describe 'Farm Facade' do
  it 'finds farms' do
    response = FarmFacade.all_farms

    expect(response.first).to be_a(Farm)
  end

  it 'gets one farm' do
    user1 = 3
    response = FarmFacade.find_farm(user1)

    expect(response).to be_a(Farm)
  end

  it 'creates a farm' do
  end

  it 'updates a farm' do
  end
end
