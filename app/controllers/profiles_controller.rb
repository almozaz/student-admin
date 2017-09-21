class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  before_action :set_roles
  before_action :authenticate_user!
  before_action :admin_only, except: [:new, :create, :show, :update]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      @all_students = Profile.where(admin: false).ids
      StudentList.create(list: @all_students)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @profile.update(profile_params)
      @all_students = Profile.where(admin: false).ids
      StudentList.create(list: @all_students)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name)
    end

    def set_roles
      @students = Profile.where(admin: false)
      @admins = Profile.where(admin: true)
    end

    def admin_only
    unless current_user.profile.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

end
