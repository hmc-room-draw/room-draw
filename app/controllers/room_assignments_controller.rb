class RoomAssignmentsController < ApplicationController
  before_action :set_room_assignment, only: [:show, :edit, :update, :destroy]
  include RoomAssignmentsHelper

  # GET /room_assignments
  # GET /room_assignments.json
  def index
    @room_assignments = RoomAssignment.all
  end

  # GET /room_assignments/1
  # GET /room_assignments/1.json
  def show
  end

  # GET /room_assignments/new
  def new
    @room_assignment = RoomAssignment.new
  end

  def new_from_pull
    @room_assignment = RoomAssignment.new
    @pull_id = params[:pull_id]
  end

  # GET /room_assignments/1/edit
  def edit
  end

  # POST /room_assignments
  # POST /room_assignments.json
  def create
    @room_assignment = RoomAssignment.new(room_assignment_params)
    @pull_id = params[:pull_id]

    respond_to do |format|
      if @room_assignment.save
        if (@pull_id)
          format.html { redirect_to Pull.find(params[:pull_id]), notice: 'Room assignment was successfully created.' }
          format.json { render :show, status: :created, location: Pull.find(params[:pull_id]) }
        else
          format.html { redirect_to action: "index"}
        end
      else
        if @pull_id
          format.html { render :new_from_pull }
        else
          format.html { render :new }
        end
      end
    end
  end

  # PATCH/PUT /room_assignments/1
  # PATCH/PUT /room_assignments/1.json
  def update
    respond_to do |format|
      if @room_assignment.update(room_assignment_params)
        format.html { redirect_to @room_assignment, notice: 'Room assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_assignment }
      else
        format.html { render :edit }
        format.json { render json: @room_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_assignments/1
  # DELETE /room_assignments/1.json
  def destroy
    @room_assignment.destroy
    respond_to do |format|
      format.html { redirect_to room_assignments_url, notice: 'Room assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_assignment
      @room_assignment = RoomAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_assignment_params
      params.require(:room_assignment).permit(:student_id, :pull_id, :room_id, :assignment_type)
    end
end
