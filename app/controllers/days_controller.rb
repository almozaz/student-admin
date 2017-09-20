class DaysController < ApplicationController
  before_action :authenticate_user!

  def index
    @days = Day.all
    @new_day = Day.new 
  end

  def show
    @day = Day.find(params[:id])
  end
end
