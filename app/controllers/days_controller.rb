class DaysController < ApplicationController
  before_action :authenticate_user!

  def index
    @days = Day.all
    @new_day = Day.new
  end

  def show
    @day = Day.find(params[:id])
    @match_pairs = @day.match_pairs
  end
end
