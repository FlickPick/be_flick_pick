FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    role { Faker::Number.between(from: 0, to: 2) }
    movie_history { Faker::Movie.title }
    password { Faker::Alphanumeric.alpha(number: 15) }
  end
end