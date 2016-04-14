class PropertiesController
  def initialize
    @properties = DataHelper.parse_properties
  end
  
  def create(property_params)
    
  end
  
  def index
    @properties
  end
end