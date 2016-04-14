class Province
  attr_accessor :name, :upper_left, :bottom_right
  
  def initialize(name, upper_left={}, bottom_right={})
    @name = name
    @upper_left = upper_left if upper_left
    @bottom_right = bottom_right if bottom_right
  end
  
  def parse_boundaries(boundaries)
    @upper_left = boundaries["upperLeft"]
    @bottom_right = boundaries["bottomRight"]
  end
end