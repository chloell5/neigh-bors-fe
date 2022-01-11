require 'rails_helper'

RSpec.describe UserService do
  it 'data from API' do
    response = UserService.get_data('users')

    expect(response).to be_an(Array)
    expect(response.first).to be_a(Hash)
    expect(response.first).to have_key(:id)
    expect(response.first).to have_key(:type)
    expect(response.first).to have_key(:attributes)
    expect(response.first[:attributes]).to have_key(:email)
  end
end
