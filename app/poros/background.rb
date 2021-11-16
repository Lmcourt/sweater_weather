class Background
  attr_reader :id, :location, :image, :credit
  def initialize(data, location)
    @id = nil
    @location = location
    @image = data[:urls][:raw]
    @credit = credit_info(data)
  end

  private

  def credit_info(data)
    {
      source: 'unsplash.com',
      photographer: data[:user][:name],
      photographer_url: data[:user][:links][:html]
    }

  end
end
