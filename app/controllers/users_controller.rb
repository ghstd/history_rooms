class UsersController < ApplicationController

  skip_before_action :authenticate_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to root_path, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity, notice: 'Wrong name or password'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
