class ReservationMailer < ActionMailer::Base
  default from: "from@example.com"

  def reservation_confirmation(reservation)
    @reservation = reservation
    @user = @reservation.user

    mail(to: @user.email, subject: 'Reservation created')
  end

  def time_share_scheduled(reservation)
    @reservation = reservation
    @user = @reservation.user

    mail(to: "jvidalba@gmail.com", subject: 'Time share scheduled')
  end
end
