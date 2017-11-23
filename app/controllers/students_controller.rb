class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  include StudentsHelper

  def index
    @students = Student.all
    @users = User.select {|user| user.has_student?}
  end


  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
    @user.student = Student.new
    @action = "create"
    @method = :post
  end


  def edit
    @action = "update"
    @user = User.find(params[:id])
    @method = :patch
  end


  def create
    @user = User.new(user_params)
    @user.student = Student.new(student_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user.student, notice: 'Student was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update(user_params)
        if @user.student.update(student_params)
          format.html { redirect_to @user.student, notice: 'Student was successfully updated.' }
        else
          format.html { render :edit }
        end
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.student.destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    def user_params
      params.fetch(:user).permit(:first_name, :last_name, :email, :is_admin)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params[:user].fetch(:student).permit(:class_rank, :room_draw_number, :has_participated, :user_id, :has_completed_form)
    end
end
