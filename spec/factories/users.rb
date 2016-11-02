FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'Papushaev'
    password_confirmation 'Papushaev'
  end
end
