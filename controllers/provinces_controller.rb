class ProvincesController
  def initialize
    @provinces = DataHelper.parse_provinces
  end
  
  def create(province_params)
    
  end
  
  def index
    @provinces
  end
end