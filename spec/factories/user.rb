FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    role { Faker::Number.between(from: 1, to: 10) }
    language_pref { Faker::Number.between(from: 1, to: 10) }
    movie_history { Faker::Movie.title }
    password_digest { Faker::Alphanumeric.alpha(number: 15) }
  end
end