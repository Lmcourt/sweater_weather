require 'rails_helper'

RSpec.describe ActivityService, :vcr do
  it 'returns activities' do
    activity = ActivityService.activity_by_type("recreational")

    expect(activity).to be_a(Hash)
    expect(activity.size).to eq(7)
  end
end
