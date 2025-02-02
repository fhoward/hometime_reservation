require 'rails_helper'

RSpec.describe "Api::V1::Reservations", type: :request do
  describe "POST api/v1/create" do
    it { should have_http_status(:created) }
  end
end
