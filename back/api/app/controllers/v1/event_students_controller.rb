module V1
  class EventStudentsController < ApplicationController
    protect_from_forgery :except => [:index, :create]
    skip_before_action :authenticate_student_from_token!, only: [:create]
    # イベント予約
    def create
      @event_student = EventStudent.create event_student_params
      render json: @event_student, each_serializer: V1::EventStudentSerializer
    end

    def destroy
      @event_student = EventStudent.find_by(event_id: params[:event_id], student_id: params[:student_id])
      binding.pry
      @event_student.destroy
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
