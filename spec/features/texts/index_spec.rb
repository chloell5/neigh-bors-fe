require 'rails_helper'

RSpec.describe 'Text' do
  it 'title' do
    visit texts_path

    expect(page).to have_content("Texts Index")
  end

  it 'form' do
    visit texts_path

    expect(page).to have_content("Recipient number")
    expect(page).to have_content("Message")
    expect(page).to have_field(:recipient_number)
    expect(page).to have_field(:message)
  end

  it 'button' do
    visit texts_path

    expect(page).to have_button("Save")
  end
end