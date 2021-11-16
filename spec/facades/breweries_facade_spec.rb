require 'rails_helper'

RSpec.describe BreweriesFacade, :vcr do
  it 'gets brewery info' do
    brew = BreweriesFacade.breweries_by_location("denver,co", 5)
    expect(brew).to be_a(Breweries)
  end
end
