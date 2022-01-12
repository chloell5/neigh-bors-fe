require 'rails_helper'

RSpec.describe 'Resources' do
  it 'title' do
    visit resources_path

    expect(page).to have_content("Emergency Resources")
  end

  it 'links' do
    visit resources_path

    expect(page).to have_link("https://www.farmers.gov/protection-recovery")
    expect(page).to have_link("https://dhsem.colorado.gov/")
    expect(page).to have_link("http://veterinaryextension.colostate.edu/menu1/prepare.shtml")
  end

  it 'link descriptions' do
    visit resources_path

    expect(page).to have_content("United States Department of Agriculture")
    expect(page).to have_content("Colorado Division of Homeland Security & Emergency Management homepage")
    expect(page).to have_content("Resource guide for farm disaster preparedness")
  end
end