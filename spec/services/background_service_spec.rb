require 'rails_helper'

RSpec.describe BackgroundService, :vcr do
  it 'returns a background images data' do
    photo = BackgroundService.photo_by_location('chicago')
    expect(photo).to be_a(Hash)
    expect(photo.size).to eq(20)
    expect(photo).to have_key(:urls)
    expect(photo[:urls]).to be_a(Hash)

    expect(photo[:urls]).to have_key(:raw)
    expect(photo[:urls][:raw]).to be_a(String)

    expect(photo[:user]).to be_a(Hash)
    expect(photo[:user]).to have_key(:name)
    expect(photo[:user][:name]).to be_a(String)

    expect(photo[:user][:links]).to have_key(:html)
    expect(photo[:user][:links][:html]).to be_a(String)
  end
end
