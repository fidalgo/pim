# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "32 Elm Street"
    postal_code "3875 SE"
    city "Seatle"
    country "United States of America"
  end
end
