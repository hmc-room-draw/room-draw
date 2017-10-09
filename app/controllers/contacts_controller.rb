class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.message = @contact.message << "\nDO NOT REPLY TO THIS EMAIL\n"
    temp = @contact.name
    regex = temp.match(/([a-zA-Z]).*\s(\w*)\z/i)
    @contact.email = regex[1] << regex[2] << "@g.hmc.edu"
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Thank you for your message!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end