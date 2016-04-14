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