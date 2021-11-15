require 'rails_helper'

RSpec.describe ActivityFacade, :vcr do
  it 'gets activity info' do
    activity = ActivityFacade("recreational")
    expect(activity).to be_a(Activity)
  end
end
