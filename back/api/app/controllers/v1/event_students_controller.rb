module V1
  class EventStudentsController < ApplicationController
    protect_from_forgery :except => [:index, :create]
    skip_before_action :authenticate_student_from_token!, only: [:create]
    # イベント予約
    def create
      @event_student = EventStudent.create event_student_params
      render json: @event_student, each_serializer: V1::EventStudentSerializer
    end

    def destory
      @event_student = EventStudent.destory
      render json: @event_student, each_serializer: V1::EventStudentSerializer
    end

    # def index
    #   @student = Event.find(1)
    #   render json: @event.students, each_serializer: V1::Students
    # end

    private
      def event_student_params
        params.require(:event_student).permit(:student_id, :event_id)
      end
  end
end
