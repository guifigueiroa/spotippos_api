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
        expect(p.square_meters).not_to be_nil
      end
    end
  end
end

describe ProvincesArray do
  let(:provinces) { ProvincesArray.new }
  it "should act like an array" do
    expect(provinces).to respond_to :<<
    expect(provinces).to respond_to :[]
    expect(provinces).to respond_to :[]=
    expect(provinces).to respond_to :first
    expect(provinces).to respond_to :last
    expect(provinces).to respond_to :add
    expect(provinces).to respond_to :each
    expect(provinces).to respond_to :length
  end
end

describe PropertiesArray do
  let(:properties) { PropertiesArray.new }
  let(:next_id) { properties.next_id }
  let(:new_property) { Property.new(34,12,4,2,77,next_id) }
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
end