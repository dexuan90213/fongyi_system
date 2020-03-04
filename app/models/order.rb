class Order < ApplicationRecord
  belongs_to :customer

  validates :number, :delivered_at, presence: true
  validates :number, length: { is: 6 }, uniqueness: true
end
