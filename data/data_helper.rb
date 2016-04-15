require 'json'
require_relative '../models/property.rb'
require_relative '../models/province.rb'

class DataHelper
  
  PROPERTIES_PATH = 'data/properties.json'
  PROVINCES_PATH = 'data/provinces.json'
  
  def self.parse_file(file)
    JSON.parse(File.read(file))
  end
  
  def self.parse_provinces
    pvc_hash = parse_file(PROVINCES_PATH)
    pvc_hash.map do |key, bounds|
      p = Province.new(key)
      p.parse_boundaries(bounds["boundaries"])
      p
    end
  end
  
  def self.parse_properties(provinces)
    ppt_hash = parse_file(PROPERTIES_PATH)
    
    ppt_hash["properties"].map do |params|
      property = Property.new(params)
      property.provinces = get_provinces(property, provinces)
      property
    end
  end
  
  def self.get_provinces(property, provinces)
    provinces_array = []
    provinces.each do |province|
      if province.inside_province?(property.x, property.y)
        provinces_array << province
      end
    end
    provinces_array
  end
end