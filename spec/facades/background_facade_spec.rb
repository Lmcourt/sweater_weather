require 'rails_helper'

RSpec.describe BackgroundFacade, :vcr do
  it 'gets photo info' do
    photo = BackgroundFacade.photo_by_location('orlando')
    expect(photo).to be_a(Background)
  end
end
