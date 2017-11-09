class AdminStudentsController < ApplicationController
  #include Pundit

  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Enforce that all endpoints call `authorize`
  #after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index

  # GET /users
  # GET /users.json
  def index
    @users = User.all#policy_scope(User)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    @user.student = Student.new
    @action = "create"
    @method = :post
  end

  # GET /users/1/edit
  def edit
    @action = "update"
    @user = User.find(params[:id])
    @method = :patch
  end

  # POST /users
  # POST /users.json
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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
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

  # DELETE /users/1
  # DELETE /users/1.json
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
      params[:admin_students].fetch(:student).permit(:class_rank, :room_draw_number, :has_completed_form, :has_participated)
    end
end
