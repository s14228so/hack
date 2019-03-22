module V1
  class TeamsController < ApplicationController
     skip_before_action :authenticate_company_from_token!
      skip_before_action :authenticate_student_from_token!

    protect_from_forgery :except => [:index]

    def index
    end

    def show
        student = Student.find(params[:id])
        @teams = student.teams
        render json: @teams, each_serializer: V1::TeamSerializer
    end

    def one
        @team = Team.find(params[:id])
        render json: @team, each_serializer: V1::TeamSerializer
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

