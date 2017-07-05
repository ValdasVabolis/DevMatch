class ProfilesController < ApplicationController
  
  # Make sure user is logged in before executing any actions
  before_action :authenticate_user!
  # Make sure user is executing actions on his account
  before_action :check_current_user
  
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
      flash[:success] = "Profile created successfully."
      redirect_to user_path(id: params[:user_id])
    else
      flash[:danger] = "Something went wrong. Please try again!"
      render action: :new
    end
  end
  # GET to /users/:user_id/profile/edit
  def edit
    # Retrieve user's existing profile so user can see current form
    @profile = User.find(params[:user_id]).profile
  end
  # PATCH/PUT to /users/:user_id/profile 
  def update
    # Retrieve user's profile from db
    @profile = User.find(params[:user_id]).profile
    # Update the profile 
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated successfully."
      # Redirect user to their profile page
      redirect_to user_path(id: params[:user_id])
    else
      flash[:danger] = "Something went wrong. Please try again!"
      render action: :edit
    end
  end
  
  private
    def profile_params
      # Whitelist forms for security (only accept these params in our db)
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title,
                                      :phone_number, :contact_email, :description)
    end
    def check_current_user
      @user = User.find(params[:user_id])
      redirect_to root_path unless @user == current_user
    end
  
end