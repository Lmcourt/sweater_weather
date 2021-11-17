require 'rails_helper'

RSpec.describe Background, :vcr do
  it 'has attributes' do
    location = 'orlando'
    photo = BackgroundService.photo_by_location(location)
    background = Background.new(photo, location)

    expect(background).to be_a(Background)
    expect(background.id).to eq(nil)
    expect(background.location).to eq(location)
    expect(background.image).to eq(photo[:urls][:raw])
    expect(background.credit).to eq({
      source: 'unsplash.com',
      photographer: photo[:user][:name],
      photographer_url: photo[:user][:links][:html]
      })
  end
end
