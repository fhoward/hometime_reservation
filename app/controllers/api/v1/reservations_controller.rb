class Api::V1::ReservationsController < ApplicationController
  def create
    payload = params
    # normalize params using reservation services
    normalized_payload = ReservationPayloadNormalizer.normalize(payload)
    # handle guest find email else create
    guest = Guest.find_or_initialize_by(email: normalized_payload[:guest][:email])
    if guest.update(normalized_payload[:guest])
      reservation = guest.reservations.create!(normalized_payload[:reservation])

      render json: { message: "Reservation created successfully", reservation: reservation }, status: :created
    else
      render json: { error: "Failed to update guest: #{guest.errors.full_messages.join(', ')}" }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: "Validation failed: #{e.record.errors.full_messages.join(', ')}" }, status: :unprocessable_entity
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
