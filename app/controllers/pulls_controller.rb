class PullsController < ApplicationController
  before_action :set_pull, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /pulls
  # GET /pulls.json
  def index
    authorize Pull
    @pulls = Pull.all.order(created_at: :desc)
  end

  # GET /pulls/1
  # GET /pulls/1.json
  def show
    authorize @pull
  end

  # GET /pulls/new
  def new
    authorize Pull
    @pull = Pull.new
    1.times {@pull.room_assignments.build}
    #TODO: Get only the necessary information
    @students = Student.all
    @rooms = Room.all
    @dorms = Dorm.all
  end

  # GET /pulls/1/edit
  def edit
    #TODO: Get only the necessary information
    @students = Student.all
    @rooms = Room.all
    @dorms = Dorm.all
    
    authorize @pull
  end

  # POST /pulls
  # POST /pulls.json
  def create
    @students = Student.all
    @dorms = Dorm.all
    @rooms = Room.all

    @pull = Pull.new(pull_params)
    authorize @pull

    cps = @pull.get_conflicting_pulls
    cannot_override = cps.select { |cp| not @pull.can_override(cp) }

    if not cannot_override.empty?
      respond_to do |format|
        ids = cannot_override.map { |co| co.id }
        format.html { render :new, error: "Can't pull! Conflicts with other pulls #{ids * ","}." }
      end
    elsif @pull.has_conflicting_nonpulls
      respond_to do |format|
        format.html { render :new, error: "Can't pull! Conflicts with preplacements or frosh." }
      end
    end


    if not cps.empty?
      cps.each do |cp|
        # TODO: email people from destroyed pulls

        cp.students.each { |student|
          # TODO: Update these for more detail later
          subject = "Pull bumped"
          content = "Your pull has been bumped."
          GeneralMailer.reminder_email(student.user, subject, content)
        }

        cp.destroy()
      end
    end

    @pull.students.each { |student|
      # TODO: Update these for more detail later
      dorm = student.room_assignment.room.dorm
      room = student.room_assignment.room.number
      puller = "#{@pull.student.user.first_name} #{@pull.student.user.last_name}"

      subject = "Pulled into #{dorm} #{room}"
      content = "You have been pulled into #{dorm} #{room} by #{puller}."
      GeneralMailer.reminder_email(student.user, subject, content)
    }

    respond_to do |format|
      redirect_path = get_redirect_path(params, @pull)
      if @pull.save
        format.html { redirect_to redirect_path, notice: "Pull was successfully created." }
        format.json { render :show, status: :created, location: @pull }
      else
        format.html { render :new }
        format.json { render json: @pull.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pulls/1
  # PATCH/PUT /pulls/1.json
  def update
    @students = Student.all
    @dorms = Dorm.all
    @rooms = Room.all
    
    authorize @pull

    respond_to do |format|
      if @pull.update(pull_params)
        redirect_path = get_redirect_path(params, @pull)
        format.html { redirect_to redirect_path, notice: "Pull was successfully updated." }
        format.json { render :show, status: :ok, location: @pull }
      else
        format.html { render :edit }
        format.json { render json: @pull.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pulls/1
  # DELETE /pulls/1.json
  def destroy
    authorize @pull

    @pull.destroy
    respond_to do |format|
      redirect_path = get_redirect_path(params, pulls_url)
      format.html { redirect_to redirect_path, notice: "Pull was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pull
      @pull = Pull.find(params[:id])
    end

    def get_redirect_path(params, default)
      return params["redirect_path"] ? params["redirect_path"] : default
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def pull_params
      params.require(:pull).permit(:message, :student_id, :round, room_assignments_attributes: [:assignment_type, :student_id, :pull_id, :room_id])
    end

end
