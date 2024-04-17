class ApplicationController < ActionController::Base

  include SessionsHelper

  before_action :authenticate_user

  def authenticate_user
    if !current_user
      session[:url] = params[:id]
      redirect_to login_path
    end
  end

end
