class Product < ApplicationRecord
  belongs_to :brand
  has_many :access_controls
  has_many :users, through: :access_controls
  has_many :reportings

  monetize :price_cents, :allow_nil => true

  def calculate_price_with_discount
    if discount_percentage.present?
      discounted_price = price.to_f * (1 - discount_percentage / 100)
      discounted_price.round(2)
    else
      price
    end
  end

end