require 'forwardable'

class PropertiesArray
  include Enumerable
  extend Forwardable

  def initialize
    @values = DataHelper.parse_properties
  end

  # Map some of the common array methods to our internal array
  def_delegators :@values, :<<, :[], :[]=, :last, :first, :add, :each, :length
end