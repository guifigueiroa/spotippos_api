require_relative 'data_helper'
require 'forwardable'

class PropertiesData
  include Enumerable
  extend Forwardable

  def initialize
    @provinces = DataHelper.parse_provinces
    @properties = DataHelper.parse_properties(@provinces)
  end
  
  def find(id)
    search = @properties.select {|p| p.id == id }
    search.first if search
  end
  
  def next_id
    max = @properties.max {|a, b| a.id <=> b.id }
    if max
      max.id + 1
    else
      1
    end
  end

  # Map some of the common array methods to our internal array
  def_delegators :@properties, :<<, :[], :[]=, :last, :first, :add, :each, :length
end