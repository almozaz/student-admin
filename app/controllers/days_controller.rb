class DaysController < ApplicationController
  before_action :authenticate_user!

  def index
    @days = Day.all
  end

  def show
    @day = Day.find(params[:id])
    @match_pairs = @day.match_pairs
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

end
