class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @student = Student.new
  end
end
