class EventsController < ApplicationController
  def show
    @student = current_student
    @events = Event.all
    # @event = Event.find(params[:id])
  end

  def index
  end
end
