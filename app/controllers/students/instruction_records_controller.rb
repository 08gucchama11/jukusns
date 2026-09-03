class Students::InstructionRecordsController < Students::ApplicationController
  def index
    @instruction_records = Current.student.instruction_records
                                  .includes(:teacher)
                                  .order(created_at: :desc)
  end
end
