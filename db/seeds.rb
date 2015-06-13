# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'pry'


def create_event(event_hash)
  Event.create(seat_geek_id: event_hash["id"], 
    listing_count: event_hash["stats"]["listing_count"], 
    average_price: event_hash["stats"]["average_price"], 
    lowest_price: event_hash["stats"]["lowest_price"], 
    highest_price: event_hash["stats"]["highest_price"], 
    title: event_hash["title"], 
    datetime_local: event_hash["datetime_local"])
end

def create_artist(artist_hash)
  artist = Artist.find_or_create_by(seat_geek_id: artist_hash["id"])
  Artist.update(artist.id, 
    event_count: artist_hash["stats"]["event_count"],
    name: artist_hash["name"],
    )
end

def create_venue(venue_hash)
  venue = Venue.find_or_create_by(seat_geek_id: venue_hash["id"])
  Venue.update(venue.id,
    city: venue_hash["city"],
    name: venue_hash["name"],
    extended_address: venue_hash["extended_address"],
    display_location: venue_hash["display_location"],
    state: venue_hash["state"],
    postal_code: venue_hash["postal_code"],
    longitude: venue_hash["location"]["lon"],
    latitude: venue_hash["location"]["lat"],
    address: venue_hash["address"],
    )
end

def create_genre(name)
  Genre.find_or_create_by(name: name)
end


key = ENV["SEATGEEK_ID"]
base_url = "http://api.seatgeek.com/2/events"
query = "?postal_code=10004&per_page=100&range=25mi&taxonomies.name=concert&client_id=#{key}"

def seed(base_url, query, page)
  page_string = "&page=#{page}"
  hash = JSON.load(open(base_url+query+page_string))

  hash["events"].each do |event_hash|
    new_event = create_event(event_hash)


    new_venue = create_venue(event_hash["venue"]) 
    new_event.venue = new_venue
    new_venue.save
    new_event.save
    event_hash["performers"].each do |artist|
      new_artist = create_artist(artist)
      new_event.artists << new_artist
      # associate events and artists
      if artist["genres"]
        artist["genres"].each do |genre|
          new_genre = create_genre(genre["name"])
          new_artist.genres << new_genre unless new_artist.genres.include?(new_genre)
          #associate genres and artists
        end
      end
    end
  end
end

10.times do |i|
  seed(base_url, query, i+1)
  puts "done with page #{i}"
end


