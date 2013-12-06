class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
=begin
  def twitter
    user = User.from_omniauth_twitter(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Sign in with twitter!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
=end

  def facebook
    user = User.from_omniauth_facebook(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Sign in with facebook!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

end
