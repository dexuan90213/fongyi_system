class Product < ApplicationRecord
  validates :name, presence: true

  has_many :prices
  accepts_nested_attributes_for :prices
end
