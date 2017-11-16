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
      @rooms = @dorm.room
      @pull = Pull.new
      3.times {@pull.room_assignments.build}
      #TODO: Get only the necessary information
      @students = Student.all
      @rooms = Room.all
      @dorms = Dorm.all
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
