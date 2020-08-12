class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)

    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:my_errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def update
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      redirect_to :edit
    end
  end


  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
