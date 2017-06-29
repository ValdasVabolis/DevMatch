class ContactMailer < ActionMailer::Base
  default to: "thisisvaldasvabolis@gmail.com"
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    # constructs the email message
    mail(from: email, subject: 'Contact Form Message')
  end
end