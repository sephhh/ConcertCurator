class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def home
  end

  def list
    if params["commit"] == "List By Genre"
      @events = Event.find_similar_shows(params["genre"])
    elsif params["commit"] == "List By Week"
      # binding.pry
      @events = Event.week_of(*params["week"].split("SPLITHERE"))
    end


    render 'events/index'
  end



  def random

  if params["commit"] == "Under 20 bucks"
    cheap_events = Event.where("average_price <= 20.0")
    @event = cheap_events.sample
  elsif params["commit"] == "TONIGHT!!!"
    today = Time.now.strftime('%d')
    this_month = Time.now.strftime('%b')
    tonight_events = Event.all.select { |event| event.day == today && event.month == this_month}
    @event = tonight_events.sample
  elsif params["commit"] == "Similar show"
    genre_ids = params["genre_ids"].collect {|genre_id| genre_id.to_i}
    similar_shows = Event.find_similar_shows(genre_ids.sample)
    @event = similar_shows.sample
  else 
    # if params["commit"] == "Give me a random show"
    id = rand(Event.first.id..Event.last.id)
    @event = Event.find(id)
  end

  if @event && @event.has_genres?
    @genre_ids = []
    @event.artists.each do |artist|
      @genre_ids.concat(artist.genres.pluck(:id))
    end
    @has_genres = true
  else
    @has_genres = false
  end
    render 'home'
  end



end
