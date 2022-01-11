require 'rails_helper'

RSpec.describe 'Farm Facade' do
  it 'finds farms' do
    response = FarmFacade.all_farms

    expect(response.first).to be_a(Farm)
  end
end
