require 'spec_helper.rb'

describe DataHelper do
  let(:provinces) { DataHelper.parse_provinces }
  let(:properties) { DataHelper.parse_properties(provinces) }
  
  describe "#parse_provinces" do
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
        expect(p.square_meters).not_to be_nil
      end
    end
  end
  
  describe "#get_provinces" do
    it "returns array of provinces given property and possible provinces" do
      array = DataHelper.get_provinces(properties.first, provinces)
      expect(array.first).to be provinces.first
    end
    it "every property has at least on province" do
      properties.each do |property|
        array = DataHelper.get_provinces(property, provinces)
        
        expect(array.length).to be > 0 
        expect(array.length).to be <= 2
        expect(array.first).to be_instance_of Province
      end
    end
  end
end

describe PropertiesData do
  let(:properties) { PropertiesData.new }
  let(:next_id) { properties.next_id }
  let(:property_params) { { "id" => next_id, "x" => 34, "y" => 53, "beds" => 1, "baths" => 1, "squareMeters" => 40 } }
  let(:new_property) { Property.new(property_params) }
  before do
    properties << new_property
  end
  
  it "should act like an array" do
    expect(properties).to respond_to :<<
    expect(properties).to respond_to :[]
    expect(properties).to respond_to :[]=
    expect(properties).to respond_to :first
    expect(properties).to respond_to :last
    expect(properties).to respond_to :add
    expect(properties).to respond_to :each
    expect(properties).to respond_to :length
  end
  
  describe "#find" do
    it "finds by id" do
      expect(properties.find(next_id)).to eql new_property
      expect(properties.find(nil)).to be_nil
      expect(properties.find(0)).to be_nil
    end
  end
  
  describe "#next_id" do
    it "increments 1 to the last id" do
      expect(properties.next_id).to eql next_id + 1
    end
  end
  
  describe "#find_properties_within" do
    let(:search) { properties.find_properties_within(0,50,50,0) }
    
    it "has hash with adequate structure" do
      expect(search.length).to eq 2
      expect(search).to be_instance_of Hash
      expect(search[:foundProperties]).not_to be_nil
      expect(search[:properties]).not_to be_nil
    end
    
    it "finds all properties with given params" do
      expect(search[:properties].length).to eq 7
      expect(search[:properties].first).to be_instance_of Property
    end
  end
end