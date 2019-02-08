class Api::EventsController < ApplicationController
  protect_from_forgery :except => [:index,:create, :show]
  def index
    @events = Event.all
    render "index", formats: "json", handlers: "jbuilder"
  end
  def show
    @event = Event.find(params[:id])
    render "show", formats: "json", handlers: "jbuilder"
  end
end
