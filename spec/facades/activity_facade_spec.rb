require 'rails_helper'

RSpec.describe ActivityFacade, :vcr do
  it 'gets activity info' do
    activity = ActivityFacade.activity_by_type("recreational", "chicago,il")
    expect(activity).to be_a(Activity)
  end
end
