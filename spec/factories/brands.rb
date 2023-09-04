FactoryBot.define do
  factory :brand do
    association :user, factory: :admin

    name { 'Brand Name' }
    description { 'Brand Description' }
    website { 'https://example.com' }
    established_year { 2020 }
    location { 'Brand Location' }
    availability { true }
  end
end
