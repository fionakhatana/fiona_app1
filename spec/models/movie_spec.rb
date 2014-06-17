require 'spec_helper'

describe Movie do
#  pending "add some examples to (or delete) #{__FILE__}"

#   let(:mov){FactoryGirl.create(:movie)}
   let(:mov1){FactoryGirl.create(:movie_with_songs)}
   let(:movie){Movie.new(:name => 'fiona$$')}
   let(:movie1){Movie.create(:name => 'Fiona')}
#   let(:movie1){Movie.create(name => 'fiona')}
   
   context "Capital" do
     it "check  name" do
        expect(movie1.valid?).to eq(true)
     end
   end
   context "not_capital" do
     it "check not_capital name" do
#     expect(movie.name).to match(/^[A-z0-9]+$/)     
        expect(movie.valid?).to eq(false)
     end
   end

   it "no name" do
     expect(movie.name).not_to eq(nil)
	end


   it "validates uniqueness of name" do
     m1=Movie.new(:name => 'fionaa')
     m2=Movie.new(:name => 'fionaa')
     m1.save
#     expect(m1.name).not_to eq(m2.name)
     expect(m2.valid?).to eq(false)
     m2.save
   end
   
   it "movie with songs" do
     p mov1
   end

end
