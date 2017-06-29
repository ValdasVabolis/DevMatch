class ContactsController < ApplicationController
  # Rails looks for corresponding view file (new.html.erb)
  # when routes.rb calls this action, that's how we display
  # the webpage we want.
  
  # GET request to /contact-us
  # Show new contact form
  def new
    # create a blank contact object
    @contact = Contact.new
  end
  # saves contact form to db
  # POST request to /contacts
  def create
    # mass assign form fields into Contact object
    @contact = Contact.new(contact_params)
    # try to save Contact object to db
    if @contact.save
      # store form fields via parameters into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # plug variables into Contact Mailer email method and send email
      ContactMailer.contact_email(name, email, body).deliver
      # store success message in flash hash
      flash[:success] = "Message sent!"
      # redirect to new action
      redirect_to contact_us_path
    else
      # if Contact object doesn't save
      # store errors in flash hash and redirect to the new action
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to contact_us_path
    end
  end
  
  private
    # to collect data from form, we need to use
    # strong parameters and whitelist the form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end