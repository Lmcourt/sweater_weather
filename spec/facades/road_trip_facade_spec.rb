require 'rails_helper'

RSpec.describe RoadTripFacade, :vcr do

  it 'gets route info' do
    trip = RoadTripFacade.road_trip("denver,CO", "Pueblo, CO")
    expect(trip).to be_a(RoadTrip)
  end

  it 'gets travel time' do
    route = MapService.route("denver,CO", "Pueblo, CO")
    time = RoadTripFacade.time_split(route)

    expect(time).to eq(["01", "45", "23"])
  end
end
