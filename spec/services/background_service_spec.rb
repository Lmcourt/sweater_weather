require 'rails_helper'

RSpec.describe BackgroundService, :vcr do
  it 'returns a background images data' do
    photo = BackgroundService.photo_by_location('chicago')
    expect(photo).to be_a(Hash)
    expect(photo.size).to eq(3)

    result = photo[:results].first
    expect(result).to have_key(:urls)
    expect(result[:urls]).to be_a(Hash)

    expect(result[:urls]).to have_key(:raw)
    expect(result[:urls][:raw]).to be_a(String)

    expect(result[:user]).to be_a(Hash)
    expect(result[:user]).to have_key(:name)
    expect(result[:user][:name]).to be_a(String)

    expect(result[:user][:links]).to have_key(:html)
    expect(result[:user][:links][:html]).to be_a(String)
  end
end
