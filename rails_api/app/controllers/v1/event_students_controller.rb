module V1
  class EventStudentsController < ApplicationController
    protect_from_forgery :except => [:index]

    def index
      render json: , each_serializer: V1::EventStudentSerializer
    end


  end
end
