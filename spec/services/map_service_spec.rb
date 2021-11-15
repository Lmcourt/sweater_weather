require 'rails_helper'

RSpec.describe MapService, :vcr do
  it 'returns map location' do
    map = MapService.map_data('Denver,co')
    expect(map).to be_a(Hash)
    expect(map.size).to eq(2)
    expect(map[:lat]).to be_a(Float)
    expect(map[:lng]).to be_a(Float)
  end
end
