require_relative '../data/properties_data'

class PropertiesController
  def initialize
    @properties = PropertiesData.new
  end
  
  def create(params)
    # validations
    return nil if params["beds"].nil? || params["beds"] < 1 || params["beds"] > 5
    return nil if params["baths"].nil? || params["baths"] < 1 || params["baths"] > 4
    return nil if params["squareMeters"].nil? || params["squareMeters"] < 20 || params["squareMeters"] > 240
    
    # creating new property
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
  
  def query(ax, ay, bx, by)
    @properties.find_properties_within(ax, ay, bx, by)
  end
end