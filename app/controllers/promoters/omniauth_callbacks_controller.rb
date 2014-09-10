class Promoters::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/promoter.rb)
    @promoter = Promoter.from_omniauth(request.env["omniauth.auth"])

    if @promoter.persisted?
      sign_in_and_redirect @promoter
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_promoter_registration_url
    end
  end
end