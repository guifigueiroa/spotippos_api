require_relative 'data_helper'
require 'forwardable'

class ProvincesArray
  include Enumerable
  extend Forwardable

  def initialize
    @values = DataHelper.parse_provinces
  end

  # Map some of the common array methods to our internal array
  def_delegators :@values, :<<, :[], :[]=, :last, :first, :add, :each, :length
end