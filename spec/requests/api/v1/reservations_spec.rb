require 'rails_helper'

RSpec.describe "Api::V1::Reservations", type: :request do
  let(:headers) { { "CONTENT_TYPE" => "application/json" } }

  let(:payload_1) do
    {
      start_date: "2021-03-12",
      end_date: "2021-03-16",
      nights: 4,
      guests: 4,
      adults: 2,
      children: 2,
      infants: 0,
      status: "accepted",
      guest: {
        id: 1,
        first_name: "Wayne",
        last_name: "Woodbridge",
        phone: "639123456789",
        email: "wayne_woodbridge@bnb.com"
      },
      currency: "AUD",
      payout_price: "3800.00",
      security_price: "500",
      total_price: "4500.00"
    }
  end

  let(:payload_2) do
    {
      reservation: {
        start_date: "2021-03-12",
        end_date: "2021-03-16",
        expected_payout_amount: "3800.00",
        guest_details: {
          localized_description: "4 guests",
          number_of_adults: 2,
          number_of_children: 2,
          number_of_infants: 0
        },
        guest_email: "wayne_woodbridge@bnb.com",
        guest_first_name: "Wayne",
        guest_id: 1,
        guest_last_name: "Woodbridge",
        guest_phone_numbers: [ "639123456789", "639987654321" ],
        listing_security_price_accurate: "500.00",
        host_currency: "AUD",
        nights: 4,
        number_of_guests: 4,
        status_type: "accepted",
        total_paid_amount_accurate: "4500.00"
      }
    }
  end

  describe "POST /api/v1/reservations" do
    context "with payload 1" do
      it "creates a reservation successfully" do
        expect {
          post "/api/v1/reservations", params: payload_1.to_json, headers: headers
        }.to change(Reservation, :count).by(1)
         .and change(Guest, :count).by(1)

        expect(response).to have_http_status(:created)
        json_response = JSON.parse(response.body)

        expect(json_response["message"]).to eq("Reservation created successfully")
        expect(json_response["reservation"]["status"]).to eq("accepted")
      end
    end

    context "with payload 2" do
      it "creates a reservation successfully" do
        expect {
          post "/api/v1/reservations", params: payload_2.to_json, headers: headers
        }.to change(Reservation, :count).by(1)
         .and change(Guest, :count).by(1)

        expect(response).to have_http_status(:created)
        json_response = JSON.parse(response.body)

        expect(json_response["message"]).to eq("Reservation created successfully")
        expect(json_response["reservation"]["status"]).to eq("accepted")
      end
    end

    context "when guest email already exists" do
      before do
        Guest.create!(
          first_name: "Wayne",
          last_name: "Woodbridge",
          email: "wayne_woodbridge@bnb.com",
          phone_numbers: [ "639123456789" ]
        )
      end

      it "does not create a new guest but updates existing one" do
        expect {
          post "/api/v1/reservations", params: payload_1.to_json, headers: headers
        }.to change(Reservation, :count).by(1)
         .and change(Guest, :count).by(0)  # Guest count should not increase

        expect(response).to have_http_status(:created)
        json_response = JSON.parse(response.body)

        expect(json_response["message"]).to eq("Reservation created successfully")
        expect(json_response["reservation"]["status"]).to eq("accepted")
      end
    end

    context "when payload is invalid" do
      it "returns an error" do
        expect {
          post "/api/v1/reservations", params: { invalid: "data" }.to_json, headers: headers
        }.to_not change(Reservation, :count)

        expect(response).to have_http_status(422)
        json_response = JSON.parse(response.body)
        expect(json_response["error"]).to be_present
      end
    end
  end
end
