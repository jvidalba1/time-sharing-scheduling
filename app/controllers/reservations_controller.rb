class ReservationsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @reservation = @user.reservations.build
  end

  def create
    @user = User.find(params[:user_id])
    @reservation = @user.reservations.build(user_params)

    if @reservation.save
      # UserMailer.confirmation_email(@user).deliver!
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  private

  def user_params
    params.require(:reservation).permit(:date, :rooms, :user_id, :trip_reason, :pool, :rec_room, :on_site_doctor, :movie_theater, :time_machine)
  end
end
