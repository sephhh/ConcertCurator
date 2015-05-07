class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def home
  end

  def random
    id = rand(1..Event.count)
    @event = Event.find(id)
    @submitted = true
    render 'home'
  end



end
