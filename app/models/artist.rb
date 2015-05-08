class Artist < ActiveRecord::Base

    has_many :artist_events
    has_many :events, through: :artist_events
    has_many :artist_genres
    has_many :genres, through: :artist_genres


  def pretty_genres
    self.genres.pluck(:name).join(", ")
  end
end
