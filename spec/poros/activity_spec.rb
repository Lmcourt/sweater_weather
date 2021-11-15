require 'rails_helper'

RSpec.describe Activity, :vcr do
  let(:destination) { {destination: 'chicago,il'} }
  let(:forecast) { {
    summary: 'Cloudy with a chance of meatballs',
    temperature: '45 F'
  } }
  let(:activities) { { title: 'Learn a new recipe',
    type: 'cooking',
    participants: 1,
    price: 0 }
  }
  it 'has attributes' do
    activity = Activity.new(destination, activities, forecast)
        # require "pry"; binding.pry
    expect(activity.destination[:destination]).to eq("chicago,il")
    expect(activity.forecast).to eq({
      summary: 'Cloudy with a chance of meatballs',
      temperature: '45 F'
    })
    expect(activities[:type]).to eq('cooking')
  end
end
