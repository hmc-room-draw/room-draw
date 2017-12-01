class StudentsController < ApplicationController
  before_action :set_student_and_user, only: [:show, :edit, :update, :destroy]
  include StudentsHelper

  def index
    @students = Student.all
    @users = User.select {|user| user.has_student?}
  end


  def show
  end


  def new
    @user = User.new
    @user.student = Student.new
    @action = "create"
    @method = :post
  end


  def edit
    @action = "update"
    @method = :patch
  end


  def create
    @user = User.new(user_params)
    @student = Student.new(student_params)

    # check if a user already exists for that email. if yes update student for it
    if @existing_user = User.where(email: @user.email).first
      # if the user already has a student can't override
      if @existing_user.student
        respond_to do |format|
            format.html { redirect_to @existing_user.student, notice: 'There is already a user with that email adress' }
        end
      # if user has no student create one
      else
        respond_to do |format|
        @existing_user.student = @student
        if @existing_user.save && @existing_user.student.save
            format.html { redirect_to @existing_user.student, notice: 'Student was added to existing user.' }
        else
          format.html { render :edit }
        end
      end
    end
    # if no user exists create one
    else
      @user.student = @student
      respond_to do |format|
        if @user.save && @user.student.save
          format.html { redirect_to @user.student, notice: 'Student was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end 
  end


  def update    
    respond_to do |format|
      if @user.update(user_params) && @user.student.update(student_params)
          format.html { redirect_to @user.student, notice: 'Student was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
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
      params[:user].fetch(:student).permit(:class_rank, :room_draw_number, :has_participated, :user_id, :has_completed_form)
    end
end