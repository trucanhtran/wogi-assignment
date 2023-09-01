FactoryBot.define do
  factory :product do
    association :brand, factory: :brand

    name { 'Product Name' }
    description { 'Product Description' }
    category { 'Product Category' }
    stock_quantity { 10 }
    price_cents { 100 }
    price_currency { 'USD' }
    discount_percentage { 10 }
    availability { true }
  end
end
