class Province
  attr_accessor :name, :upper_left, :bottom_rigth
  
  def initialize(name, upper_left, bottom_rigth)
    @name = name
    @upper_left = upper_left
    @bottom_rigth = bottom_rigth
  end
end