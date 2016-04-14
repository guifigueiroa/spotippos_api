require_relative '../data/properties_data'

class PropertiesController
  def initialize
    @properties = PropertiesData.new
  end
  
  def create(params)
    p = Property.new(@properties.next_id,
                     params["x"],
                     params["y"],
                     params["beds"],
                     params["baths"],
                     params["squareMeters"])
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