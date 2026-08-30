class Admin::InstructionRecordsController < Admin::ApplicationController
  def index
    if params[:teacher_id].present?
      @teacher = Teacher.find(params[:teacher_id])

      @instruction_records = @teacher.instruction_records
                                      .includes(:student)
                                      .order(created_at: :desc)

    elsif params[:student_id].present?
      @student = Student.find(params[:student_id])

      @instruction_records = @student.instruction_records
                                      .includes(:teacher)
                                      .order(created_at: :desc)

    else
      @instruction_records = InstructionRecord.includes(:student, :teacher)
                                              .order(created_at: :desc)
    end
  end
end