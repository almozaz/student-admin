class Api::ProfilesController < ApplicationController


  def index
    render status: 200, json: {
      profiles: Profile.all
    }.to_json
  end

  def update
    profile = Profile.find(params[:id])

    if profile.update(profile_params)
      render status: 201, json: {
        message: "Profile updated!"
      }.to_json
    else
      render status: 422, json: {
        errors: profile.errors
      }.to_json
    end
  end

  private

  def profile_params
    params
      .require(:profile)
      .permit(:admin)      
  end

end
