class DormsController < ApplicationController
  before_action :set_dorm, only: [:show, :edit, :update, :destroy]

  # GET /dorms
  # GET /dorms.json
  def index
    @dorms = Dorm.all
  end

  # GET /dorms/1
  # GET /dorms/1.json
  def show
      @rooms = @dorm.rooms
      @pull = Pull.new
      6.times {@pull.room_assignments.build}
      #TODO: Get only the necessary information
      # @students = Student.all
      @users = User.all
      @dorms = Dorm.all
      

      #join tables
      @students = Student.joins(:user).
      select('users.first_name, users.last_name, users.email, students.*')
      
      if current_user
        if !current_user.student.nil?
            @curPullNum = current_user.student.room_draw_number    
            @curRankNum = Student.class_ranks[current_user.student.class_rank]
        else
            @curRankNum = 0 
            @curPullNum = 0
        end
    else 
        @curPullNum = 0
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
      
    @testDorm = Dorm.where({id: params[:id]}).select("rooms.*, room_assignments.*, students.*, users.*, pulls.*")
    .joins(:rooms)
    .joins("LEFT OUTER JOIN room_assignments ON room_assignments.room_id = rooms.id")
    .joins("LEFT OUTER JOIN students ON students.id = room_assignments.student_id")
    .joins("LEFT OUTER JOIN pulls on students.id = pulls.student_id")
    .joins("LEFT OUTER JOIN users ON users.id = students.user_id")
    
    @level1 = @testDorm
    .where("floor = ?", 1)
    .sort_by {|x| x.number}
    .to_json
    .html_safe 
     
    @level2 = @testDorm
    .where("floor = ?", 2)
    .sort_by {|x| x.number}
    .to_json
    .html_safe 
     
    @level3 = @testDorm
    .where("floor = ?", 3)
    .sort_by {|x| x.number}
    .to_json
    .html_safe  
  end

  # GET /dorms/new
  def new
    @dorm = Dorm.new
  end

  # GET /dorms/1/edit
  def edit
      # @students = Student.all
      # @rooms = Room.all
      # @dorms = Dorm.all
  end

  # POST /dorms
  # POST /dorms.json
  def create
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
    @dorm.destroy
    respond_to do |format|
      format.html { redirect_to dorms_url, notice: 'Dorm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
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
