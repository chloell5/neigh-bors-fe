require 'rails_helper'

RSpec.describe UserService do
  it 'data from API' do
    response = UserService.get_data('users')

    expect(response).to be_a(Hash)
    expect(response[:data]).to be_an(Array)
    expect(response[:data].first).to have_key(:id)
    expect(response[:data].first).to have_key(:type)
    expect(response[:data].first).to have_key(:attributes)
    expect(response[:data].first[:attributes]).to have_key(:email)
  end
end
