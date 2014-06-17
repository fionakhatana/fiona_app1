FactoryGirl. define do
  factory :actor do |a|
    a.name {Faker::Name.first_name}
  end
end

