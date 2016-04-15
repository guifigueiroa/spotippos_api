require 'json'

class Property
  attr_accessor :id, :x, :y, :beds, :baths, :provinces, :square_meters
  
  def initialize(params)
    @id = params["id"]
    @x = params["x"]
    @y = params["y"]
    @beds = params["beds"]
    @baths = params["baths"]
    @provinces = []
    @square_meters = params["squareMeters"]
  end
  
  def to_json
    { id: @id,
      x: @x,
      y: @y,
      beds: @beds,
      baths: @baths,
      provinces: @provinces,
      squareMeters: @square_meters }.to_json
  end
end