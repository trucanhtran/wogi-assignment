class User < ApplicationRecord
  has_many :brands
  has_many :access_controls
  has_many :products, through: :access_controls
  has_many :reportings
  has_many :cards
  has_secure_password
end