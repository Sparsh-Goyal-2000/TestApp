class ReservationMailer < ApplicationMailer
  default from: 'reservations@gmail.com'

  def confirmed(reservation)
    @reservation = reservation
    @line_items = reservation.line_items.includes(:product)
    attachments.inline['wallpaper'] = File.read('app/assets/images/img_01.jpg')
    mail to: reservation.customer.email, subject: 'Reservation Details'
  end

end
