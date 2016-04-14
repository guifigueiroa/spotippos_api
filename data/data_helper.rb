require 'json'
require_relative '../model/property.rb'
require_relative '../model/province.rb'

module DataHelper
  
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
end