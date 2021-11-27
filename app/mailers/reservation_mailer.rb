class ReservationMailer < ApplicationMailer
  default from: 'reservations@gmail.com'

  def confirmed(reservation)
    @reservation = reservation
    @line_items = reservation.line_items.includes(:product)
    mail to: reservation.customer.email, subject: 'Reservation Details'
  end

end
