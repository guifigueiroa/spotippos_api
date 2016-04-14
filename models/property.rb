require 'json'

class Property
  attr_accessor :id, :x, :y, :beds, :baths, :square_meters
  
  def initialize(id, x, y, beds, baths, square_meters)
    @id = id
    @x = x
    @y = y
    @beds = beds
    @baths = baths
    @square_meters = square_meters
  end
  
  def to_json
    { id: @id, 
      x: @x, 
      y: @y, 
      beds: @beds, 
      baths: @baths, 
      square_meters: @square_meters }.to_json
  end
end