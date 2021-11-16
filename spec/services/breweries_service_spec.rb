require 'rails_helper'

RSpec.describe BreweriesService, :vcr do
  it 'returns breweries' do
    brew = BreweriesService.breweries_by_location({ lat: 40.039401, lng: -76.307078 }, 5)

    expect(brew).to be_an(Array)
  end
end
