class Guest < ApplicationRecord
  has_many :reservations

  # Ensure phone_numbers is always an array
  before_save do
    self.phone_numbers = phone_numbers.is_a?(Array) ? phone_numbers.uniq.reject(&:blank?) : []
  end

  validates :email, presence: true, uniqueness: true
end
