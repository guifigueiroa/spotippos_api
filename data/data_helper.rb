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
  
  def self.parse_properties
    ppt_hash = parse_file(PROPERTIES_PATH)
    ppt_hash["properties"].map do |p|
      Property.new(p["x"], p["y"], p["beds"], p["baths"], p["square_meters"], p["id"])
    end
  end
end