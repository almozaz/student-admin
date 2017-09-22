class DaysController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: [:index, :show]

  def index
    if current_user.profile.admin == true
      @days = Day.all
    else
      @days = Day.only_past_days
    end
  end

  def show
    @day = Day.find(params[:id])
    @match_pairs = @day.todays_match_pairs
  end

  def new
    @day = Day.new
  end

  def create
    @student_list = StudentList.last
    @day = Day.new(day_params)
    if @day.save
      Pairing.new(@day, @student_list)
      redirect_to day_path(@day)
    else
      render :index, notice: "That day already exists"
    end
  end

private

  def day_params
    params
      .require(:day)
      .permit(:date)
  end

  def admin_only
    unless current_user.profile.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

end
