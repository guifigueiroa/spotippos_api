require 'spec_helper.rb'

describe Province do
  describe "#parse_boundaries" do
    let(:boundaries) {{"upperLeft" => {"x" => 0,"y" => 1000}, "bottomRight" => {"x" => 600,"y" => 500 }}}
    
    it "parses provices boundaries correctly" do
      province = Province.new("name")
      province.parse_boundaries(boundaries)
      
      expect(province.upper_left).to eq boundaries["upperLeft"]
      expect(province.bottom_right).to eq boundaries["bottomRight"]
      expect(province.name).to eq "name"
    end
  end
end

describe Property do
  describe "to_json" do
    let(:property) { Property.new(9999,34,53,1,1,40) }
    let(:property_json) { "{\"id\":9999,\"x\":34,\"y\":53,\"beds\":1,\"baths\":1,\"square_meters\":40}" }
    it "parses the data to json format" do
      expect(property.to_json).to eql property_json
    end
  end
end