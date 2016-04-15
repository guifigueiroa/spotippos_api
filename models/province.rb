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
  
  def inside_province?(x, y)
    if(x > upper_left["x"] && x <= bottom_right["x"] && y > bottom_right["y"] && y <= upper_left["y"])
      true
    else
      false
    end
  end
end