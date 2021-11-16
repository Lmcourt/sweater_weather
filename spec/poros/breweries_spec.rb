require 'rails_helper'

RSpec.describe Breweries, :vcr do
  let(:destination) { {destination: 'chicago,il'} }
  let(:forecast) { {
    summary: 'Cloudy with a chance of meatballs',
    temperature: 45.12
  } }
  let(:breweries) { [
    {
      id: 1,
      name: "Mescan Brewery",
      brewery_type: 'micro'
    },
    {
      id: 2,
      name: 'brew 2',
      brewery_type: 'good'
    },
    {
      id: 3,
      name: 'brew 3',
      brewery_type: 'ok'
    },
    {
      id: 4,
      name: 'brew4',
      brewery_type: 'another'
    },
    {
      id: 5,
      name: 'brew5',
      brewery_type: 'beer'
    }
    ]}

  let(:data) do
    {
      destination: destination,
      forecast: forecast,
      breweries: breweries
    }
  end

  it 'has attributes' do
    brew = Breweries.new(data)
    expect(brew.destination[:destination]).to eq("chicago,il")
    expect(brew.forecast).to eq({
      summary: 'Cloudy with a chance of meatballs',
      temperature: "45.12 F"
    })
    expect(brew.breweries.first[:name]).to eq("Mescan Brewery")
    expect(brew.breweries.first[:brewery_type]).to eq('micro')
    expect(brew.breweries.last[:id]).to eq(5)
    expect(brew.breweries.count).to eq(5)
  end
end
