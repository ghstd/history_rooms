# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    omniauth_auth
  end

  def google_oauth2
    omniauth_auth
  end

  def github
    omniauth_auth
  end

  def omniauth_auth
    auth = request.env["omniauth.auth"]
    @user = User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      if auth.info.email.blank?
        redirect_to new_user_registration_path
        flash[:notice] = "You have to provide your Email!"
        return
      end
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20] # give it a random password
    end
    # @user.confirm unless @user.confirmed? # add this line if :confirmable is enabled
    sign_in_and_redirect @user, event: :authentication # :event is for warden to execute callbacks for :authentication
    set_flash_message(:notice, :success, kind: auth.provider)
  end
end
