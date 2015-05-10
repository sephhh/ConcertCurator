class Event < ActiveRecord::Base

  belongs_to :venue
  has_many :artist_events
  has_many :artists, through: :artist_events



  def self.week_of(start_day, end_day)
    # binding.pry
    start_day = start_day.to_datetime
    end_day = end_day.to_datetime
    Event.where("datetime_local >= ? AND datetime_local <= ?", start_day, end_day)
  end


  def pretty_date
    self.datetime_local.strftime("%A, %d %b %Y %l:%M %p")
  end

  def week
    self.datetime_local.strftime('%W')
  end
  def day
    self.datetime_local.strftime('%d')
  end
  def month_day
    self.datetime_local.strftime('%b') + " " + self.day
  end

  def has_genres?
    self.artists.any? do |artist| 
      !(artist.genres.empty?) 
    end
  end

  def self.week_select_options
    self.all.group_by(&:week).sort.collect do |week, week_events|
      ["#{week_events.first.month_day}-#{week_events.last.month_day}", "#{week_events.first.datetime_local}SPLITHERE#{week_events.last.datetime_local}"]
    end
  end

  # def self.find_similar_shows(genre_ids)
  #   self.select do |event|
  #     event.artists.any? do |artist|
  #       genre_ids & artist.genres.pluck(:id) != []
  #     end
  #   end
  # end
  
  def self.find_similar_shows(genre_id)
    self.joins(:artists => :genres).where(genres: {id: genre_id})
  end



end
