require 'spec_helper.rb'

describe DataHelper do
  describe "#parse_provinces" do
    let(:provinces) { DataHelper.parse_provinces }
    
    it "parses all provinces correctly" do      
      expect(provinces.length).to eq 6
      expect(provinces).to be_instance_of Array
      expect(provinces.first).to be_instance_of Province
    end
    
    it "provinces do not have nil attributes" do
      provinces.each do |p|
        expect(p.name).not_to be_nil
        expect(p.upper_left).not_to be_nil
        expect(p.bottom_right).not_to be_nil
      end
    end
  end
  
  describe "#parse_properties" do
    let(:properties) { DataHelper.parse_properties }
    
    it "parses all properties correctly" do
      expect(properties.length).to eq 4000
      expect(properties).to be_instance_of Array
      expect(properties.first).to be_instance_of Property
    end
    
    it "properties do not have nil attributes" do
      properties.each do |p|
        expect(p.id).not_to be_nil
        expect(p.x).not_to be_nil
        expect(p.y).not_to be_nil
        expect(p.beds).not_to be_nil
        expect(p.baths).not_to be_nil
        # square_meter is nil in some instances
      end
    end
  end
end