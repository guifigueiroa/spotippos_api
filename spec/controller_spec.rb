require 'spec_helper.rb'

describe PropertiesController do
  let(:ctrl) { PropertiesController.new }
  describe "#index" do
    it "retrieves all properties" do
      properties = ctrl.index
      expect(properties).to be_instance_of PropertiesData
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
  
  describe "#create" do
    let(:params){ { "x" => 10, "y" => 20, "beds" => 3, "baths" => 2, "squareMeters" => 100 } }
    
    it "adds new property to the array" do
      p = ctrl.create(params)
      
      expect(p).to be_instance_of Property
      expect(ctrl.index.last).to eql p
    end
  end
end