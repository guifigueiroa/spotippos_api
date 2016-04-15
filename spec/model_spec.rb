require 'spec_helper.rb'

describe Province do
  let(:boundaries) {{"upperLeft" => {"x" => 0,"y" => 1000}, "bottomRight" => {"x" => 600,"y" => 500 }}}
  let(:province) { Province.new("name") }
  before do
    province.parse_boundaries(boundaries)
  end
  
  describe "#parse_boundaries" do
    it "parses provices boundaries correctly" do
      expect(province.upper_left).to eq boundaries["upperLeft"]
      expect(province.bottom_right).to eq boundaries["bottomRight"]
      expect(province.name).to eq "name"
    end
  end
  
  describe "#inside_province?" do
    it "returns true when value within range" do
      expect(province.inside_province? 300, 750).to be_truthy
      expect(province.inside_province? 1, 501).to be_truthy
      expect(province.inside_province? 600, 1000).to be_truthy
    end
    it "returns false when value out of range" do
      expect(province.inside_province? 300, 500).to be_falsey
      expect(province.inside_province? 1001, 601).to be_falsey
      expect(province.inside_province? -1, -1).to be_falsey
      
    end
  end
end

describe Property do
  describe "to_json" do
    let(:property_params) { { "id" => 9999, "x" => 34, "y" => 53, "beds" => 1, "baths" => 1, "squareMeters" => 40 } }
    let(:property) { Property.new(property_params) }
    let(:property_json) { "{\"id\":9999,\"x\":34,\"y\":53,\"beds\":1,\"baths\":1,\"squareMeters\":40}" }
    it "parses the data to json format" do
      expect(property.to_json).to eql property_json
    end
  end
end