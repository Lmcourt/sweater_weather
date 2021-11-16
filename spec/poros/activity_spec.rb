require 'rails_helper'

RSpec.describe Activity, :vcr do
  let(:destination) { {destination: 'chicago,il'} }
  let(:forecast) { {
    summary: 'Cloudy with a chance of meatballs',
    temperature: 45.12
  } }
  let(:activities) { [{ title: 'Learn a new recipe',
    type: 'cooking',
    participants: 1,
    price: 0 },
    { title: 'chocolate',
      type: 'recreational',
      participants: 1,
      price: 0 }]
  }
  let(:data) do
    {
      destination: destination,
      forecast: forecast,
      activities: activities
    }
  end
  it 'has attributes' do
    activity = Activity.new(data)
        # require "pry"; binding.pry
    expect(activity.destination[:destination]).to eq("chicago,il")
    expect(activity.forecast).to eq({
      summary: 'Cloudy with a chance of meatballs',
      temperature: "45.12 F"
    })
    expect(activities.first[:type]).to eq('cooking')
  end
end
