require_relative '../data/properties_data'

class PropertiesController
  def initialize
    @properties = PropertiesData.new
  end
  
  def create(params)
    params["id"] = @properties.next_id
    p = Property.new(params)
    @properties << p
    p
  end
  
  def index
    @properties
  end
  
  def show(id)
    @properties.find(id)
  end
end