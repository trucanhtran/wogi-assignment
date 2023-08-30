class Product < ApplicationRecord
  belongs_to :brand
  has_many :access_controls
  has_many :users, through: :access_controls
  has_many :reportings

  # Other code and validations
end