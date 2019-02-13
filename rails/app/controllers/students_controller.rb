class StudentsController < ApplicationController
 protect_from_forgery :except => [:index,:create, :show]
 before_action :authenticate_student!
  def index
  end

  def show
    @students = Student.all
    @student = current_student
    @events = Event.all
    @event_students = @student.event_students
     @event_ids = []
      @my_events = []
      @event_students.each do |event_student|
      @event_ids << event_student.event_id
      @my_events << event_student.event
    end
  

  end

  def edit
  end

  def update
    current_student.update(params.require(:student).permit(images: []))
    redirect_to "/mypage"
  end
end