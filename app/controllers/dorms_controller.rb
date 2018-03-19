require 'rubygems'
require 'json'

class DormsController < ApplicationController
  before_action :set_dorm, only: [:show, :edit, :update, :destroy, :load_pull_ajax, :create_pull_ajax, :get_data]
  after_action :verify_authorized, except: [:index, :load_pull_ajax, :create_pull_ajax, :get_data]


  # GET /dorms
  # GET /dorms.json
  def index
    if not current_user.is_admin?
      redirect_to root_path
    end
    
    @dorms = Dorm.all
  end

  def create_pull_ajax
    get_available_students()
    @rooms = @dorm.rooms
    @dorms = Dorm.all
    @pull = Pull.new
    @selected_rooms = JSON.parse(params["selected_rooms"])
    total_capacity = 0
    @selected_rooms.each do |room_data|
      total_capacity += room_data[1]
    end
    total_capacity.times {@pull.room_assignments.build}
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def get_data

    roomData = @dorm.rooms
      .joins("LEFT OUTER JOIN room_assignments ON room_assignments.room_id = rooms.id")
      .joins("LEFT OUTER JOIN students ON students.id = room_assignments.student_id")
      .joins("LEFT OUTER JOIN users ON users.id = students.user_id")
      .joins("LEFT OUTER JOIN pulls ON pulls.id = room_assignments.pull_id")
      .joins("LEFT OUTER JOIN students pulling_students ON pulling_students.id = pulls.student_id")
      .select("rooms.id, rooms.floor, rooms.number, rooms.capacity, " \
              "room_assignments.assignment_type, room_assignments.description, room_assignments.pull_id," \
              "students.class_rank, students.room_draw_number, students.id as student_id," \
              "users.first_name, users.last_name, users.email, " \
              "pulls.message, pulls.round," \
              "pulling_students.class_rank as pull_rank, pulling_students.room_draw_number as pull_number, pulling_students.number_is_last as is_last")
    @level1 = roomData
    .where("floor = ?", 1)
    .sort_by {|x| x.number}
    .to_json
    .html_safe 
     
    @level2 = roomData
    .where("floor = ?", 2)
    .sort_by {|x| x.number}
    .to_json
    .html_safe 
     
    @level3 = roomData
    .where("floor = ?", 3)
    .sort_by {|x| x.number}
    .to_json

    get_available_students()

    respond_to do |format|
      format.js {render layout: false}
    end
  end

  # GET /dorms/1
  # GET /dorms/1.json
  def show
    authorize @dorm

    # Render one form or the other depending on whether the peron's an admin
    if current_user
      @admin = current_user.is_admin?
      @student = current_user.student
      @is_student = current_user.student.nil?
    end

    @period = current_draw_period ? true : false
    @pull = Pull.new
    1.times {@pull.room_assignments.build}
    @dorms = Dorm.all
    #join tables
    get_available_students()

    if current_user
      if !current_user.student.nil?
        @curPullNum = current_user.student.room_draw_number
        @isLast = current_user.student.number_is_last ? true : false
        @curRankNum = Student.class_ranks[current_user.student.class_rank]
        @studentId = current_user.student.id
      else 
        @curRankNum = 0
        @isLast = 0
        @curPullNum = 0
        @studentId = -1
      end
    else 
      @curRankNum = 0
      @isLast = 0
      @curPullNum = 0
      @studentId = -1
    end
    
    case @dorm.name.downcase
      when 'case'
        @json = JSON.parse(File.read('app/assets/jsons/case.json')).to_json.html_safe
        @floor1 = "case1.png"
        @floor2 = "case2.png"
      when 'atwood'
        @json = JSON.parse(File.read('app/assets/jsons/atwood.json')).to_json.html_safe
        @floor1 = "atwood1.png"
        @floor2 = "atwood2.png"
        @floor3 = "atwood3.png"
      when 'drinkward'
        @json = JSON.parse(File.read('app/assets/jsons/drinkward.json')).to_json.html_safe
        @floor1 = "drinkward1.png"
        @floor2 = "drinkward2.png"
        @floor3 = "drinkward3.png"
      when 'east'
        @json = JSON.parse(File.read('app/assets/jsons/east.json')).to_json.html_safe
        @floor1 = "east1.png"
        @floor2 = "east2.png"
      when 'linde'
        @json = JSON.parse(File.read('app/assets/jsons/linde.json')).to_json.html_safe
        @floor1 = "linde1.png"
        @floor2 = "linde2.png"
      when 'north'
        @json = JSON.parse(File.read('app/assets/jsons/north.json')).to_json.html_safe
        @floor1 = "north1.png"
        @floor2 = "north2.png"
      when 'sontag'
        @json = JSON.parse(File.read('app/assets/jsons/sontag.json')).to_json.html_safe
        @floor1 = "sontag1.png"
        @floor2 = "sontag2.png"
      when 'south'
        @json = JSON.parse(File.read('app/assets/jsons/south.json')).to_json.html_safe
        @floor1 = "south1.png"
        @floor2 = "south2.png"
      when 'west'
        @json = JSON.parse(File.read('app/assets/jsons/west.json')).to_json.html_safe
        @floor1 = "west1.png"
        @floor2 = "west2.png"
    end 

    # get dimensions - https://stackoverflow.com/a/2450931/1294423
    # (only works for PNGs)
    if !@floor1.nil?
      @floor1dims = IO.read('app/assets/images/'+@floor1)[0x10..0x18].unpack('NN')
    end
    if !@floor2.nil?
      @floor2dims = IO.read('app/assets/images/'+@floor2)[0x10..0x18].unpack('NN')
    end
    if !@floor3.nil?
      @floor3dims = IO.read('app/assets/images/'+@floor3)[0x10..0x18].unpack('NN')
    end

    roomData = @dorm.rooms
      .joins("LEFT OUTER JOIN room_assignments ON room_assignments.room_id = rooms.id")
      .joins("LEFT OUTER JOIN students ON students.id = room_assignments.student_id")
      .joins("LEFT OUTER JOIN users ON users.id = students.user_id")
      .joins("LEFT OUTER JOIN pulls ON pulls.id = room_assignments.pull_id")
      .joins("LEFT OUTER JOIN students pulling_students ON pulling_students.id = pulls.student_id")
      .select("rooms.id, rooms.floor, rooms.number, rooms.capacity, " \
              "room_assignments.assignment_type, room_assignments.description, room_assignments.pull_id," \
              "students.class_rank, students.room_draw_number, students.id as student_id," \
              "users.first_name, users.last_name, users.email, " \
              "pulls.message, pulls.round, " \
              "pulling_students.class_rank as pull_rank, pulling_students.room_draw_number as pull_number, pulling_students.number_is_last as is_last")

    @level1 = roomData
    .where("floor = ?", 1)
    .sort_by {|x| x.number}
    .to_json
    .html_safe 
     
    @level2 = roomData
    .where("floor = ?", 2)
    .sort_by {|x| x.number}
    .to_json
    .html_safe 
     
    @level3 = roomData
    .where("floor = ?", 3)
    .sort_by {|x| x.number}
    .to_json
    .html_safe  
  end

  # GET /dorms/new
  def new
    authorize Dorm
    @dorm = Dorm.new
  end

  # GET /dorms/1/edit
  def edit
    authorize @dorm
    # @students = Student.all
    # @rooms = Room.all
    # @dorms = Dorm.all
  end

  # POST /dorms
  # POST /dorms.json
  def create
    authorize Dorm
    @dorm = Dorm.new(dorm_params)

    respond_to do |format|
      if @dorm.save
        format.html { redirect_to @dorm, notice: 'Dorm was successfully created.' }
        format.json { render :show, status: :created, location: @dorm }
      else
        format.html { render :new }
        format.json { render json: @dorm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dorms/1
  # PATCH/PUT /dorms/1.json
  def update
    authorize @dorm
    respond_to do |format|
      if @dorm.update(dorm_params)
        format.html { redirect_to @dorm, notice: 'Dorm was successfully updated.' }
        format.json { render :show, status: :ok, location: @dorm }
      else
        format.html { render :edit }
        format.json { render json: @dorm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dorms/1
  # DELETE /dorms/1.json
  def destroy
    authorize @dorm
    @dorm.destroy
    respond_to do |format|
      format.html { redirect_to dorms_url, notice: 'Dorm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_available_students
      @students = Student.joins(:user)
          .joins("LEFT OUTER JOIN room_assignments ON students.id = room_assignments.student_id")
          .where("room_assignments.student_id IS NULL AND students.has_completed_form='t'")
          .select("users.first_name, users.last_name, users.email, students.*")
          .order("email ASC")
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_dorm
      @dorm = Dorm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dorm_params
      params.require(:dorm).permit(:name)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_pull
      @pull = Pull.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pull_params
      params.require(:pull).permit(:message, :student_id, :round, room_assignments_attributes: [:assignment_type, :student_id, :pull_id, :room_id])
    end
end
