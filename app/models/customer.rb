class Customer < ApplicationRecord
  belongs_to :area

  validates :name, presence: true, uniqueness: true
end