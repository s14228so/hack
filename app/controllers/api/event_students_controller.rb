class Api::EventStudentsController < ApplicationController
  protect_from_forgery :except => [:create]
  def create
      EventStudent.create!(student_id: current_student.id,
                        event_id: params[:event_id])
  end

end
