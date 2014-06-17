require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
#  describe "#method"  for instance  methods
#  describe ".method"  for class meethods
=begin
   before(:each) do
     @user =User.create(:name => 'fiona') #instance variable
   end
=end
# another approach to before is let block i.e lazy block used  when variableis to be  created when using the partic test

#  let(:user){User.create(:name => 'fiona')}
  let(:user){FactoryGirl.create(:user)}
  it "verify username" do
    expect(user.name).not_to eq('fiona')
  end

end
