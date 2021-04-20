class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    contact_params = { name: params[:name], email: params[:email], message: params[:message] }

    ContactsMailer.contact(contact_params).deliver_now
    redirect_to new_contact_path
    flash[:info] = t('.message_sent')
  end
end
