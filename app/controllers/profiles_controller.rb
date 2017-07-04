class ProfilesController < ApplicationController
  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    # Create a profile instance to be used in our profile form
    @profile = Profile.new
  end
  # POST to /users/:user_id/profile
  def create
    # Ensure that we have the user who is filling out form
    @user = User.find(params[:user_id])
    # Create profile linked to this specific user
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile updated successfully."
      redirect_to root_path
    else
      flash[:danger] = "Something went wrong. Please try again!"
      render action: :new
    end
  end
  
  private
    def profile_params
      # Whitelist forms for security (only accept these params in our db)
      params.require(:profile).permit(:first_name, :last_name, :job_title,
                                      :phone_number, :contact_email, :description)
    end
  
end