class Teachers::StudentsController < Teachers::ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end
end
