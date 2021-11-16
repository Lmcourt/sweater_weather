require 'rails_helper'

RSpec.describe BreweriesService, :vcr do
  it 'returns breweries' do
    brew = BreweriesService.breweries_by_location("38.8977,77.0365", 5)

    expect(brew).to be_an(Array)
  end
end
