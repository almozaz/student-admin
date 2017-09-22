class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
    @match = @user.todays_match
  end

end
