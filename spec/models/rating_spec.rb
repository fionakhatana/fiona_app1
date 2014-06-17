require 'spec_helper'
describe Rating do
   let(:rate){Rating.create(:stars => 9)}
   it "rating between 0-5" do
     expect(rate.valid?).to eq(false)
   end
   it "range error" do
      expect(rate.valid?).to eq(false)
   end

end
