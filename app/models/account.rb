class Account < ApplicationRecord
  validates :cvv, :credit_card_number, presence: true, uniqueness: true
  validates :cvv, length: { is: 3 }
  validates :credit_card_number, length: { is: 16 }

  belongs_to :user
end
