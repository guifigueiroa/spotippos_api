require 'spec_helper.rb'

describe PropertiesController do
  let(:ctrl) { PropertiesController.new }
  describe "#index" do
    it "retrieves all properties" do
      properties = ctrl.index
      expect(properties).to be_instance_of PropertiesArray
      expect(properties.length).to eql 4000
    end
  end
  
  describe "#show" do
    it "finds and retrieves the property by id" do
      property = ctrl.show(40)
      expect(property).not_to be_nil
      expect(property.x).to eql 962
      expect(property.y).to eql 451
      expect(property.beds).to eql 5
      expect(property.baths).to eql 4
      expect(property.square_meters).to eql 150
    end
  end
end

describe ProvincesController do
  let(:ctrl) { ProvincesController.new }
  describe "#index" do
    it "retrieves all provinces" do
      provinces = ctrl.index
      expect(provinces).to be_instance_of ProvincesArray
      expect(provinces.length).to eql 6
    end
  end
end