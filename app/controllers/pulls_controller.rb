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
    params[:pullCount][:submission].to_i.times {@pull.room_assignments.build}
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
    validate_room_cap
    from_dorm = params[:from_dorm]
    @students = Student.all
    @dorms = Dorm.all
    @rooms = Room.all

    @pull = Pull.new(pull_params)
    authorize @pull

    capacity_check = validate_room_cap
    if capacity_check
      redirect_back(fallback_location: root_path, notice: capacity_check) and return
    end

    cps = @pull.get_conflicting_pulls
    cannot_override = cps.select { |cp| not @pull.can_override(cp) }

    #TODO: I made some escapes to avoid problems that call this method from different places
    #      but some of them might not be necessary.
      if not cannot_override.empty?
        ids = cannot_override.map { |co| co.id }
        redirect_back(fallback_location: root_path, notice: "Can't pull! Conflicts with pulls #{ids * ","}.") and return
      elsif @pull.has_conflicting_nonpulls
          # format.html { redirect_to  controller: "dorm", action: "show", id: from_dorm,notice: "Can't pull! Conflicts with preplacements or frosh." }# and return
          redirect_back(fallback_location: root_path, notice: "Can't pull! Conflicts with preplacements or frosh.") and return
      end


    if not cps.empty? 
      cps.each do |cp|
        email_students(cp)
        cp.destroy
      end
    end

    @pull.students.each { |student|
      # TODO: Update these for more detail later
      dorm = student.room_assignment.room.dorm
      room = student.room_assignment.room.number
      puller = "#{@pull.student.user.first_name} #{@pull.student.user.last_name}"

      subject = "Pulled into #{dorm} #{room}"
      content = "You have been pulled into #{dorm} #{room} by #{puller}."
      GeneralMailer.send_email(student.user, subject, content)
    }

    respond_to do |format|
      redirect_path = get_redirect_path(params, @pull)
      if @pull.save
        if from_dorm
          # format.html{redirect_to({controller: "dorm", action: "show", id: from_dorm}, notice: "Pull was successfully created." )}
          format.html{redirect_back(fallback_location: root_path, notice: "Pull was successfully created.")}
        else
          format.html { redirect_to @pull, notice: "Pull was successfully created." }
          format.json { render :show, status: :created, location: @pull }
        end

      else
        if from_dorm
          # format.html{redirect_to controller: "dorm", action: "show", id: from_dorm}
          format.html{redirect_back(fallback_location: root_path)}
        else
          format.html { render :new }
          format.json { render json: @pull.errors, status: :unprocessable_entity }
        end
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

  def email_students(pull)
    pull.students.each { |student|
      # TODO: Update these for more detail later
      subject = "Pull bumped"
      content = "Your pull has either been bumped or was deleted by an admin."
      GeneralMailer.send_email(student.user, subject, content)
    }
  end

  # DELETE /pulls/1
  # DELETE /pulls/1.json
  def destroy
    authorize @pull

    @pull.students.each { |student|
      # TODO: Update these for more detail later
      subject = "Pull bumped"
      content = "Your pull has either been bumped or was deleted by an admin."
      GeneralMailer.send_email(student.user, subject, content)
    }


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


    #TODO: currently, I am returning the message, but it's better to cause an error 
    #     and pass error message to the redirect called when we call @pull.save
    def validate_room_cap      
      counter = 0
      ra_attributes = params[:pull][:room_assignments_attributes][counter.to_s]
      room_list = Hash.new(0)
      while ra_attributes do
        room_id = ra_attributes[:room_id]
        if room_id != ""
          if room_list.has_key?(room_id)
            room_list[room_id] += 1
          else
            room_list[room_id] = 1
          end
        end
        counter += 1
        ra_attributes = params[:pull][:room_assignments_attributes][counter.to_s]
      end

      message = nil
      room_list.keys.each{ |key|

        room = Room.find(key)
        room_cap = room.capacity
        room_name = room.number
        dorm_name =room.dorm.name
        if room_cap != room_list[key]
          if message
            message += "You need #{room_cap} people for #{dorm_name} #{room_name}, but you pulled #{room_list[key]} people. "
          else
            message =  "You need to fullfill all of the rooms with as many people as the capacity. You need #{room_cap} people for #{dorm_name}#{room_name}, but you pulled #{room_list[key]} people. "
          end
        end
      }
      message
    end
end
