class ContactsMailer < ApplicationMailer
  def contact(contact_params)
    @name = contact_params[:name]
    @email = contact_params[:email]
    @message = contact_params[:message]

    mail(to: "fe12092019odesa@gmail.com", subject: "Your Site send email")
  end
end
