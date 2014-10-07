class ReservationsController < ApplicationController

  before_filter :email_confirmed?, only: [:new, :create]

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
    @reservation = @user.reservations.build(reservation_params)
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

  def email_confirmed?
    @user = User.find(params[:user_id])

    unless @user.email_confirmed?
      flash[:alert] = "Please check your email"
      redirect_to root_path
    end
  end


  def reservation_params
    params.require(:reservation).permit(:date, :rooms, :user_id, :trip_reason, :pool, :rec_room, :on_site_doctor, :movie_theater, :time_machine)
  end
end
