class ReservationPayloadNormalizer
  def self.normalize(payload)
    if payload.key?("reservation")
      normalize_payload_2(payload["reservation"])
    else
      normalize_payload_1(payload)
    end
  end

  private

  def self.normalize_payload_1(payload)
    {
      guest: {
        id: payload["guest"]["id"],
        first_name: payload["guest"]["first_name"],
        last_name: payload["guest"]["last_name"],
        phone_numbers: [ payload["guest"]["phone"] ]&.compact || [],  # Ensure an array
        email: payload["guest"]["email"]
      },
      reservation: {
        start_date: payload["start_date"],
        end_date: payload["end_date"],
        nights: payload["nights"],
        guests: payload["guests"],
        adults: payload["adults"],
        children: payload["children"],
        infants: payload["infants"],
        status: payload["status"],
        currency: payload["currency"],
        payout_price: payload["payout_price"],
        security_price: payload["security_price"],
        total_price: payload["total_price"]
      }
    }
  end

  def self.normalize_payload_2(payload)
    {
      guest: {
        id: payload["guest_id"],
        first_name: payload["guest_first_name"],
        last_name: payload["guest_last_name"],
        phone_numbers: payload["guest_phone_numbers"] || [],
        email: payload["guest_email"]
      },
      reservation: {
        start_date: payload["start_date"],
        end_date: payload["end_date"],
        nights: payload["nights"],
        guests: payload["number_of_guests"],
        adults: payload["guest_details"]["number_of_adults"],
        children: payload["guest_details"]["number_of_children"],
        infants: payload["guest_details"]["number_of_infants"],
        status: payload["status_type"],
        currency: payload["host_currency"],
        payout_price: payload["expected_payout_amount"],
        security_price: payload["listing_security_price_accurate"],
        total_price: payload["total_paid_amount_accurate"]
      }
    }
  end
end
