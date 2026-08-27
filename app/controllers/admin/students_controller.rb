class Admin::StudentsController < Admin::ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to admin_students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to admin_student_path(@student)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(
      :name, :code, :password, :password_confirmation,
      :school, :grade, :postal_code, :address,
      :telephone_number, :parent_name,
      :parent_telephone_number, :is_active
    )
  end
end