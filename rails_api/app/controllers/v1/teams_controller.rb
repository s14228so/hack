module V1
  class TeamsController < ApplicationController
    protect_from_forgery :except => [:index]

    def index
    end

    def show
        @teams = current_student.teams
        render json: @teams, each_serializer: V1::TeamsSerializer
    end

    def create
    end

    def update
    end

    def destroy
    end

    def private
      params.require(:team).permit(:name, :introduction)
    end
  end
end

