class ContactsMailer < ApplicationMailer
  def contact(name, email, message)
    @name = name
    @email = email
    @message = message

    mail to: "fe12092019odesa@gmail.com"
  end
end
