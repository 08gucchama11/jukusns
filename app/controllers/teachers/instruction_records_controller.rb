class Teachers::InstructionRecordsController < Teachers::ApplicationController
  before_action :set_instruction_record, only: %i[ edit update ]

  def index
    if params[:student_id].present?
      @student = Student.find(params[:student_id])
      @instruction_records = @student.instruction_records
                                      .includes(:teacher)
                                      .order(created_at: :desc)
    else
      @instruction_records = Current.teacher.instruction_records
                                     .includes(:student)
                                     .order(created_at: :desc)
    end
  end

  def new
    @student = Student.find(params[:student_id])
    @instruction_record = InstructionRecord.new(student: @student)
  end

  def create
    @student = Student.find(params[:student_id])
    @instruction_record = Current.teacher.instruction_records.new(instruction_record_params)
    @instruction_record.student = @student

    if @instruction_record.save
      redirect_to teachers_student_path(@student), notice: "指導記録を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = @instruction_record.student
  end

  def update
    @student = @instruction_record.student

    if @instruction_record.update(instruction_record_params)
      redirect_to teachers_instruction_records_path(student_id: @student.id),
                  notice: "指導記録を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_instruction_record
    @instruction_record = Current.teacher.instruction_records.find_by(id: params[:id])
    return if @instruction_record.present?

    redirect_to teachers_instruction_records_path, alert: "権限がありません。"
  end

  def instruction_record_params
    params.require(:instruction_record).permit(:subject, :unit, :instruction_record)
  end
end