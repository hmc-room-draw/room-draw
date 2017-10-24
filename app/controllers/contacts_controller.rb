class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.message = @contact.message << @contact.footer
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Email has been sent!'
    else
      flash.now[:error] = 'Cannot send email. Please try again.'
      render :new
    end
  end
end