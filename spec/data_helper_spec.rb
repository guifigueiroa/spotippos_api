require 'spec_helper.rb'

describe DataHelper do
  describe "#parse_provinces" do
    it "parses all provinces correctly" do
      provinces = DataHelper.parse_provinces
      
      expect(provinces.length).to eq 6
      expect(provinces.first).to be_instance_of Province
      expect(provinces.first.name).not_to be_nil
      expect(provinces.first.upper_left).not_to be_nil
      expect(provinces.first.bottom_right).not_to be_nil
    end
  end
end