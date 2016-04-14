class Property
  attr_accessor :id, :x, :y, :beds, :baths, :square_meters
  
  def initialize(x, y, beds, baths, square_meters, id=nil)
    @x = x
    @y = y
    @beds = beds
    @baths = baths
    @square_meters = square_meters
    @id = id
  end
end