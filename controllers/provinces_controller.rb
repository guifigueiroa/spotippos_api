require_relative '../data/provinces_array'

class ProvincesController
  def initialize
    @provinces = ProvincesArray.new
  end
  
  def create(province_params)
    
  end
  
  def index
    @provinces
  end
end