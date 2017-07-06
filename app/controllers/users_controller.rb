class UsersController < ApplicationController
  
  # Make sure the user is logged in before showing any profiles
  before_action :authenticate_user!
  
  # GET to /users
  def index
    # Get all users from db
    # Put the user and profiles table together into one query
    # to minimize server requests
    @users = User.includes(:profile)
  end
  
  # GET to /users/:id
  def show
    @user = User.find(params[:id])
  end
end