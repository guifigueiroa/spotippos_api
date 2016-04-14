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