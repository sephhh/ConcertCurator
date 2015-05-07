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
  if params["commit"] == "Give me a random show"
    id = rand(1..Event.count)
    @event = Event.find(id)
  elsif params["commit"] == "Under 20 bucks"
    cheap_events = Event.where("average_price <= 20.0")
    @event = cheap_events.sample
  elsif params["commit"] == "TONIGHT!!!"
    today = Time.now.strftime('%d')
    tonight_events = Event.all.select { |event| event.day == today }
    @event = tonight_events.sample

  end

    @submitted = true
    render 'home'
  end



end
