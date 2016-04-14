require_relative '../data/properties_array'

class PropertiesController
  def initialize
    @properties = PropertiesArray.new
  end
  
  def create(property_params)
    
  end
  
  def index
    @properties
  end
  
  def show(id)
    @properties.find(id)
  end
end