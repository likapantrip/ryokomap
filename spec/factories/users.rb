FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)+'1a'}
    password_confirmation {password}
    user_name             {Faker::Internet.username}
  end
end
