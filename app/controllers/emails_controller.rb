class EmailsController < ApplicationController
  before_action :set_email, only: [:edit, :update, :destroy]

  def new
    @email = Email.new
  end

  def edit
  end

  def index
  end

  def show
    @status = []
    @emails []= Email.all.reverse
    Email.all.reverse.each do |email|
      dateDiff = (email.sendDate - Date.today).to_i
      puts "DATEDIFF", dateDiff
      @emails.push((email, (dateDiff > 0) ? "Pending" : "Sent"))
    end
  end

  def create
    puts "AT LEAST THE FIRST FUNCTION GOT CALLED."
    # fetch created email
    email = params["email"]

    # convert information in datetime_select form to Ruby date:
    # https://stackoverflow.com/questions/5073756/where-is-the-
    # rails-method-that-converts-data-from-datetime-select-into-a-datet

    # extract send datetime
    sendDate = Date.new(email["sendDate(1i)"].to_i,
                        email["sendDate(2i)"].to_i,
                        email["sendDate(3i)"].to_i)
    # extract subject of the email
    subject = email["subject"]

    # extract content of the email
    content = email["description"]
    @email = Email.new(subject: subject, description: content, sendDate: sendDate)

    respond_to do |format|
      if @email.save
        # Run bin/delayed_job start to process all jobs
        puts "CALLING FUNC WITH PARAMS", sendDate, @email.attributes['id']
        GeneralMailer.reminder_email_to_non_participants(sendDate, @email.attributes['id'])
        format.html { redirect_to emails_show_path, notice: 'Email was successfully created.' }
        format.json { render :show, status: :ok}
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      email = params["email"]
      params["email"]["sendDate"] = Date.new(email["sendDate(1i)"].to_i,
                                            email["sendDate(2i)"].to_i,
                                            email["sendDate(3i)"].to_i)
      if @email.update(email_params)
        format.html { redirect_to emails_show_path, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_show_url, notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:subject, :description, :sendDate)
    end

end
