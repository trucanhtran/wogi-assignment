FactoryBot.define do
  factory :admin, parent: :user do
    email { 'test@gmail.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
    admin {true}
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
