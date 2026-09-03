class Admin::TeachersController < Admin::ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(create_teacher_params)
    if @teacher.save
      redirect_to admin_teachers_path, notice: "講師情報の登録に成功しました。"
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

    attributes = update_teacher_params
    attributes.delete(:password) if attributes[:password].blank?

    if @teacher.update(attributes)
      redirect_to admin_teacher_path(@teacher), notice: "講師情報の更新に成功しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def create_teacher_params
    params.require(:teacher).permit(
      :name, :code, :password, :password_confirmation,
      :telephone_number, :is_active
    )
  end

  def update_teacher_params
    params.require(:teacher).permit(
      :name, :password, :telephone_number, :is_active
    )
  end
end
