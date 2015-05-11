require 'open-uri'


class Artist < ActiveRecord::Base
    include ActionView::Helpers::TagHelper

    has_many :artist_events
    has_many :events, through: :artist_events
    has_many :artist_genres
    has_many :genres, through: :artist_genres


  def pretty_genres
    self.genres.pluck(:name).join(", ")
  end

  def find_id
    youtube_basic = "https://www.googleapis.com/youtube/v3/search?part=snippet"
    artist_name_query = "&q=" + self.name.gsub(" ", "+")
    num_results = "&maxResults=10"
    key_string = "&key=AIzaSyAH_ULMQ-Ext0_W8cBvL9yo02sVZ7VpyBA"

    hash = JSON.load(open(youtube_basic+artist_name_query+num_results+key_string))

    hash["items"].first["id"]["videoId"]
    # Based off the artist's name, makes a query to the youtube API
    # From the result, grab the 'video_id' from the first video
  end

  def embed(youtube_id)
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", :class => "embed-responsive-item")  
  end

end
