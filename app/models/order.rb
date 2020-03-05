class Order < ApplicationRecord
  include AASM
  acts_as_paranoid

  belongs_to :customer

  validates :number, :delivered_at, presence: true
  validates :number, length: { is: 6 }, uniqueness: true

  aasm no_direct_assignment: true do
    state :pending, initial: true
    state :delivered
    state :wait_for_payment, :paid, :closed

    event :deliver do
      transitions from: :pending, to: :delivered
    end
  end
end
