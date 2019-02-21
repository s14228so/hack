module V1
  class CompaniesController < ApplicationController
    protect_from_forgery :except => [:index]

    def index
    end

    def create
    end

    def update
    end

    def private
      params.require(:company).permit(:name, :email, :introduction)
    end
  end
end

