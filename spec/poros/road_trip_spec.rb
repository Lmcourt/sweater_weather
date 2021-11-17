require 'rails_helper'

RSpec.describe RoadTrip do
  it 'has attributes' do
    trip = RoadTrip.new({ start_city: 'Denver,CO', end_city: 'Pueblo,CO', travel_time: '1 hour(s), 45 minutes(s)' })
    expect(trip).to be_a(RoadTrip)
    expect(trip.id).to eq(nil)
    expect(trip.start_city).to eq('Denver,CO')
    expect(trip.end_city).to eq('Pueblo,CO')
    # expect(trip.travel_time).to eq('1 hour(s), 45 minutes(s)')
  end

  it 'cant go on roadtrips through the ocean' do
    trip = RoadTrip.new({ start_city: 'Denver,CO', end_city: 'Nice,FR', travel_time: '1 hour(s), 45 minutes(s)' })
    expect(trip).to be_a(RoadTrip)
    expect(trip.id).to eq(nil)
    expect(trip.start_city).to eq('Denver,CO')
    expect(trip.end_city).to eq('Nice,FR')
    expect(trip.travel_time).to eq('impossible route')
  end
end
