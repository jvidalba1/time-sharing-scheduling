class ReservationsController < ApplicationController

  def confirmation
    @user = User.find(params[:user_id])
    @reservation = Reservation.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @reservation = @user.reservations.build
  end

  def create

    @user = User.find(params[:user_id])
    @reservation = @user.reservations.build(user_params)
    @reservation.ip_address = request.remote_ip

    if @reservation.save
      ReservationMailer.reservation_confirmation(@reservation).deliver!
      ReservationMailer.time_share_scheduled(@reservation).deliver!
      redirect_to confirmation_user_reservation_path(@user.id, @reservation.id)
    else
      render :action => 'new'
    end
  end

  private

  def user_params
    params.require(:reservation).permit(:date, :rooms, :user_id, :trip_reason, :pool, :rec_room, :on_site_doctor, :movie_theater, :time_machine)
  end
end
