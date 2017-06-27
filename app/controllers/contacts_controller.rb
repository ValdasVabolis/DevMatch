class ContactsController < ApplicationController
  def new
    # create a blank contact object
    @contact = Contact.new
  end
  # saves contact form to db
  def create
    @contact = Contact.new(contact_params)
    # if save successful
    if @contact.save
      # redirect to blank form with success message
      redirect_to new_contact_path, notice: "Message sent!"
    else
      # redirect to blank form with failure message
      redirect_to new_contact_path, notice: "Something went wrong. Please try again!"
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end