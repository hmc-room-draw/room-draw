class PullsController < ApplicationController
  before_action :set_pull, only: [:show, :edit, :update, :destroy]

  # GET /pulls
  # GET /pulls.json
  def index
    @pulls = Pull.all.order(created_at: :desc)
  end

  # GET /pulls/1
  # GET /pulls/1.json
  def show
  end

  # GET /pulls/new
  def new
    @pull = Pull.new
    3.times {@pull.room_assignments.build}
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
  end

  # POST /pulls
  # POST /pulls.json
  def create
    @pull = Pull.new(pull_params)

    respond_to do |format|
      if @pull.save
        format.html { redirect_to @pull, notice: 'Pull was successfully created.' }
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
    respond_to do |format|
      if @pull.update(pull_params)
        format.html { redirect_to @pull, notice: 'Pull was successfully updated.' }
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
    @pull.destroy
    respond_to do |format|
      format.html { redirect_to pulls_url, notice: 'Pull was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pull
      @pull = Pull.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pull_params
      params.require(:pull).permit(:message, :student_id, :round, room_assignments_attributes: [:assignment_type, :student_id, :pull_id, :room_id])
    end

end