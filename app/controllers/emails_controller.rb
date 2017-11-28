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
  end

  def create
    respond_to do |format|
      @email = makeEmail(params)
      if @email
        format.html { redirect_to emails_show_path, notice: 'Email was successfully created.' }
        format.json { render :show, status: :ok}
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def makeEmail(params)
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
    @email = Email.new(
      subject: subject, 
      description: content, 
      sendDate: sendDate,
      sent_status: false,
      send_to_never_logged_in: email["send_to_never_logged_in"],
      send_to_never_pulled_room: email["send_to_never_pulled_room"],
      send_to_formerly_in_room: email["send_to_formerly_in_room"],
      send_to_in_room: email["send_to_in_room"],
      send_to_admins: email["send_to_admins"])

    if @email.save
      GeneralMailer.schedule_reminder_email(@email["sendDate"], @email.attributes['id'])
      return @email
    else
      return nil
    end
  end

  def update
    no_errors = true
    email = params["email"]
    params["email"]["sendDate"] = Date.new(email["sendDate(1i)"].to_i,
                                          email["sendDate(2i)"].to_i,
                                          email["sendDate(3i)"].to_i)
    if params["email"]["sendDate"] != @email["sendDate"]
      @email.destroy
      no_errors = makeEmail(params)
    else
      # Don't make a new delayed job if we don't need to.
      no_errors = @email.update(email_params)
    end
    # Redirect to the right page
    respond_to do |format|
      if no_errors
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

  def get_person_counts(status_type)
    count = 0
    case status_type
    when "admin"
      count = User.all.select{|user| user.is_admin == true}.length
    else
      count = Student.all.select{|student| student.status == status_type}.length
    end
    if count == 1
      return " (currently 1 person)"
    else
      return " (currently #{count} people)"
    end
  end
  helper_method :get_person_counts


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(
        :subject, 
        :description, 
        :sendDate, 
        :send_to_never_logged_in,
        :send_to_never_pulled_room,
        :send_to_formerly_in_room,
        :send_to_in_room,
        :send_to_admins)
    end

end
