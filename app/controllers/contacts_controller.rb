class ContactsController < ApplicationController
  # Rails looks for corresponding view file (new.html.erb)
  # when routes.rb calls this action, that's how we display
  # the webpage we want. 
  def new
    # create a blank contact object
    @contact = Contact.new
  end
  # saves contact form to db
  def create
    @contact = Contact.new(contact_params)
    # if save successful
    if @contact.save
      # send the email
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body).deliver
      # redirect to blank form with success message
      flash[:success] = "Message sent!"
      redirect_to contact_us_path
    else
      # redirect to blank form with failure message
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to contact_us_path
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end