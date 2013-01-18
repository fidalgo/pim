# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'First User Factory'
    email 'first@example.com'
    password 'firstUser'
    password_confirmation 'firstUser'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
