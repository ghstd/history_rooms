class SessionsController < ApplicationController

  skip_before_action :authenticate_user

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user

      if url = session[:url]
        session[:url] = nil
        redirect_to "/rooms/#{url}"
      else
        redirect_to root_path
      end

    else
      render :new, status: :unprocessable_entity, notice: 'Wrong name or password'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
