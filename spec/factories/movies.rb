FactoryGirl. define do
  factory :movie do |u|
    u.name {Faker::Name.first_name}
  end

  factory :movie_with_songs do |m|
    after(:create) do|movie,evaluator|
      create_list(:song, 5, movie: movie)  
    end   
  end

  factory :movie_with_actorss do |m|
    after(:create) do|movie,evaluator|
      create_list(:actor, 2, movie: movie)
    end
  end

end
