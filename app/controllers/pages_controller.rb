class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
    if @user.profile.admin == false
      @match = @user.todays_match
      @past_matches = @user.past_matches
    else
      Day.auto_generate_pairs
    end
  end

end
