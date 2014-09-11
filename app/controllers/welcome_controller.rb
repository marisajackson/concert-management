class WelcomeController < ApplicationController

  def index
    if promoter_signed_in?
      redirect_to promoter_dashboard_path
    end
  end
end