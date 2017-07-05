class UsersController < ApplicationController
  
  # Make sure the user is logged in before showing any profiles
  before_action :authenticate_user!
  
  # GET to /users/:id
  def show
    @user = User.find(params[:id])
  end
end