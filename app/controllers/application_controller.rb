class ApplicationController < ActionController::Base

  def confirm_reservation
    ReservationMailer.confirmed(Reservation.last).deliver_later
    redirect_to root_path, notice: 'Reservation Details Sent'
  end

end
