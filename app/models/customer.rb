class Customer < ApplicationRecord
  belongs_to :area
  has_many :orders
  has_many :prices
  accepts_nested_attributes_for :prices

  validates :name, presence: true, uniqueness: true
end
