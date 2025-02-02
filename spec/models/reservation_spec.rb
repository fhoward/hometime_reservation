require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "association" do
    it { should belong_to(:guest) }
  end
end
