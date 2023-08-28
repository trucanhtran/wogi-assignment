class Brand < ApplicationRecord
  belongs_to :user
  has_many :products

  # Other code and validations
end