module V1
  class EventStudentsController < ApplicationController
    protect_from_forgery :except => [:index]
    def create
      @event_student = EventStudent.create event_student_params
      render json: @event_student, each_serializer: V1::EventStudentSerializer
    end

    def private
      params.require(:event_student).permit(:student_id, :event_id)
    end
  end
end
