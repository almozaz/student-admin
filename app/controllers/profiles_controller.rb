class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def set_profile
    @profile = current_user.profile
  end

<<<<<<< HEAD
  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end
=======
    def profile_params
      params.require(:profile).permit(:first_name, :last_name)
    end
>>>>>>> 0b39cdb97577d0cb9e2ebd652fcf1424f605dff2

end
