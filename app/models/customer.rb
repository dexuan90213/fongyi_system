class Customer < ApplicationRecord
  belongs_to :area
  has_many :orders

  validates :name, presence: true, uniqueness: true
end
