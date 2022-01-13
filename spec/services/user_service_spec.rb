require 'rails_helper'

RSpec.describe UserService do
  it 'gets data from API' do
    response = UserService.get_data('users')

    expect(response).to be_an(Array)
    expect(response.first).to be_a(Hash)
    expect(response.first).to have_key(:id)
    expect(response.first).to have_key(:type)
    expect(response.first).to have_key(:attributes)
    expect(response.first[:attributes]).to have_key(:email)
  end

  xit 'posts data to API' do
    response = UserService.post_data("users?name=Larry&email=larry@gmail.com&phone=1234598&address=123FakeAddress")[:data]

    expect(response).to be_a(Hash)
    expect(response).to have_key(:id)
    expect(response).to have_key(:attributes)
    expect(response[:attributes]).to have_key(:name)
    expect(response[:attributes]).to have_key(:email)
  end

  # xit 'patches data to API' do
  #   response = UserService.patch_data("users?id=13&name=Larry&email=larry@gmail.com&phone=1239876&address=123FakeAddress")
  #
  #   expect(response).to be_a(Hash)
  #   expect(response).to have_key(:id)
  #   expect(response).to have_key(:attributes)
  #   expect(response[:attributes]).to have_key(:name)
  #   expect(response[:attributes]).to have_key(:email)
  # end
end
