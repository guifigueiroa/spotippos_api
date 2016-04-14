require_relative 'data_helper'
require 'forwardable'

class PropertiesArray
  include Enumerable
  extend Forwardable

  def initialize
    @values = DataHelper.parse_properties
  end
  
  def find(id)
    search = @values.select {|p| p.id == id }
    search.first if search
  end
  
  def next_id
    max = @values.max {|a, b| a.id <=> b.id }
    if max
      max.id + 1
    else
      1
    end
  end

  # Map some of the common array methods to our internal array
  def_delegators :@values, :<<, :[], :[]=, :last, :first, :add, :each, :length
end