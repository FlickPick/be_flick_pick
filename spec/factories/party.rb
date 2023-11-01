FactoryBot.define do
  factory :party do
    access_code { Faker::Alphanumeric.alphanumeric(number: 6) } 
    max_rating { Faker::Number.between(from: 1, to: 10) } 
    max_duration { Faker::Number.between(from: 5, to: 300) } 
    genres { Faker::Lorem.words(number: 1) } 
    services { Faker::Lorem.words(number: 3).join(', ') } 
    languages { Faker::Lorem.words(number: 2).join(', ') } 
    format { ["DVD", "Blu-ray", "Digital"].sample } 
    movie_id { Faker::Number.unique.number(digits: 5) } 
  end
end