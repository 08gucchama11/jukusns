class Admin::StudentsController < Admin::ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(create_student_params)

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

    attributes = update_student_params
    attributes.delete(:password) if attributes[:password].blank?

    if @student.update(attributes)
      redirect_to admin_student_path(@student)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def create_student_params
    params.require(:student).permit(
      :name, :code, :password, :school, :grade,
      :postal_code, :address, :telephone_number,
      :parent_name, :parent_telephone_number, :is_active
    )
  end

  def update_student_params
    params.require(:student).permit(
      :name, :password, :school, :grade,
      :postal_code, :address, :telephone_number,
      :parent_name, :parent_telephone_number, :is_active
    )
  end

end