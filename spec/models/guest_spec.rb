require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe "associations" do
    it { should have_many(:reservations) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "callbacks" do
    it "ensures phone_numbers is always an array, removes duplicates and blanks" do
      guest = Guest.create!(
        first_name: "John",
        last_name: "Doe",
        email: "john@example.com",
        phone_numbers: [ "1234567890", "1234567890", "", "9876543210", nil ]
      )

      expect(guest.phone_numbers).to match_array([ "1234567890", "9876543210" ])
    end

    it "sets phone_numbers to an empty array if nil is given" do
      guest = Guest.create!(
        first_name: "Jane",
        last_name: "Doe",
        email: "jane@example.com",
        phone_numbers: nil
      )

      expect(guest.phone_numbers).to eq([])
    end
  end
end
