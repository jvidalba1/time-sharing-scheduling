class UsersController < ApplicationController

  before_filter :email_confirmed?, only: [:edit, :update]
  before_filter :email_uniq?, only: [:create]

  def confirm_page
  end

  def email_confirmed
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.confirmation_email(@user).deliver!
      render confirm_page_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(confirmed: true)

    if @user.update_attributes(user_params)
      redirect_to new_user_reservation_path(@user.id)
    else
      flash[:alert] = "Error"
      render :action => 'edit'
    end
  end

  private

  def email_confirmed?
    @user = User.find(params[:id])
    if @user.email_confirmed?
      render email_confirmed_users_path
    end
  end

  def email_uniq?
    @user = User.find_by_email(params[:user][:email])
    if @user
      if @user.email_confirmed?
        render email_confirmed_users_path
      else
        render confirm_page_users_path
      end
    end
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number)
  end

end
