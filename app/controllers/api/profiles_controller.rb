class Api::ProfilesController < ApplicationController


  def index
    render status: 200, json: {
      profiles: Profile.all
    }.to_json
  end

end
