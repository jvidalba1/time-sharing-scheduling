class UsersController < ApplicationController

  # before_filter :email_confirmed?, only: [:edit, :update]

  def confirm_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.confirmation_email(@user).deliver!
      redirect_to confirm_page_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    # @user.update_attributes(confirmed: true)
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "User updated"
      redirect_to root_path
    else
      flash[:alert] = "Error"
      render :action => 'edit'
    end
  end

  private

  # def email_confirmed?
  #   @user = User.find(params[:id])

  # end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number)
  end

end
