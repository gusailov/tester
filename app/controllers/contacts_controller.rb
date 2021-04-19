class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]
    ContactsMailer.contact(name,email,message).deliver_now
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
