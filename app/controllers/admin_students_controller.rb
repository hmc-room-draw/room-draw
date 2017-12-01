class AdminStudentsController < ApplicationController
  #include Pundit

  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Enforce that all endpoints call `authorize`
  #after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index

  # GET /admin_students
  def index
    @users = User.select {|user| user.has_student?}
  end

  # GET /admin_students/1
  def show
    @user = User.find(params[:id])
  end

  # GET /admin_students/new
  def new
    @user = User.new
    @user.student = Student.new
    @action = "create"
    @method = :post
  end

  # GET /admin_students/1/edit
  def edit
    @action = "update"
    @user = User.find(params[:id])
    @method = :patch
  end

  # POST /admin_students
  def create
    @user = User.new(user_params)
    @user.student = Student.new(student_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to action: "show", id: @user.id, notice: 'Student was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin_students/1
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        if @user.student.update(student_params)
          format.html { redirect_to action: "show", id: @user.id, notice: 'Student was successfully updated.' }
        else
          format.html { render :edit }
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin_students/1
  def destroy
    @user = User.find(params[:id])
    @user.student.destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_students_url, notice: 'Student was successfully deleted.' }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:admin_students).permit(:first_name, :last_name, :email, :is_admin)
    end
    
    def student_params
      params[:admin_students].fetch(:student).permit(:class_rank, :room_draw_number, :has_completed_form, :has_participated, :number_is_last)
    end
end
