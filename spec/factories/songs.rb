FactoryGirl.define do
  factory :song do |u|
  u.name {Faker::Name.first_name}
  u.composer  {Faker::Name.first_name}
  movie
  end
end
