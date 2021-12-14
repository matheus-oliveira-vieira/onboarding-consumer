require 'rails_helper'

describe 'Homepage' do
  it 'view countries' do
    allow(Faraday).to receive(:get).and_return(
      instance_double(Faraday::Response, status: 200, body: 'json')
    )
    visit root_path

    expect(page).to have_content('Brasil')
    expect(page).to have_content('América')
  end
end