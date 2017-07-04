class ProfilesController < ApplicationController
  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    # Create a profile instance to be used in our profile form
    @profile = Profile.new
  end
end