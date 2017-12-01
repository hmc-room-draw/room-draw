class StudentsController < ApplicationController
  include Pundit
  
  before_action :set_student_and_user, only: [:show, :edit, :update, :destroy]
  include StudentsHelper
  
  # Enforce that all endpoints call `authorize`
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @students = policy_scope(Student)
  end


  def show
    authorize @student
  end


  def new
    authorize Student
    @user = User.new
    @user.student = Student.new
    @action = "create"
    @method = :post
  end


  def edit
    authorize @student
    @action = "update"
    @method = :patch
  end


  def create
    authorize Student
    @user = User.new(user_params)
    @user.student = Student.new(student_params)

    respond_to do |format|
      if @user.save && @user.student.save
        format.html { redirect_to @user.student, notice: 'Student was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    authorize @student
    respond_to do |format|
      if @user.update(user_params) && @user.student.update(student_params)
          format.html { redirect_to @user.student, notice: 'Student was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    authorize @student
    @user.destroy
    @student.destroy

    respond_to do |format|
      if current_user.is_admin 
        format.html { redirect_to admin_students_url, notice: 'Student was successfully destroyed.' }
      else
        format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  private
    def set_student_and_user
      @student = Student.find(params[:id])
      @user = @student.user
    end

    def user_params
      params.fetch(:user).permit(:first_name, :last_name, :email, :is_admin)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params[:user].fetch(:student).permit(:class_rank, :room_draw_number, :has_participated, :user_id, :has_completed_form, :number_is_last)
    end
end
