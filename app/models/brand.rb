class Brand < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  # Other code and validations
end