class EventsController < ApplicationController
  def show
    @student = current_student
    @events = Event.all

  end

  def index
  end
end
