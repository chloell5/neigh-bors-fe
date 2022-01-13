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
    user_id = 6
    data = {
            name: "Bobs+Burros",
            number_of_animals: 12,
            address: '123FakeAddress',
            special_needs?: false}
    response = FarmFacade.farm_create(data, user_id)

    expect(response).to be_a(Farm)
    expect(response.name).to eq("Bobs Burros")
    expect(response.address).to eq("123FakeAddress")
  end

  it 'updates a farm' do
    user_id = 6
    data = {
            name: "Bobs Burros",
            number_of_animals: 17,
            address: '123FakeAddress',
            special_needs?: false}
    response = FarmFacade.farm_update(data, user_id)

    expect(response[:attributes][:number_of_animals]).to eq(17)
  end
end
