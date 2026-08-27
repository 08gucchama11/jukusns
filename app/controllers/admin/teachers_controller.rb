class Admin::TeachersController < Admin::ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to admin_teachers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      redirect_to admin_teacher_path(@teacher)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(
      :name, :code, :password, :password_confirmation,
      :telephone_number, :is_active
    )
  end
end