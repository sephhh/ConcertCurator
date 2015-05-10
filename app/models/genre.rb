class Genre < ActiveRecord::Base
  has_many :artist_genres
  has_many :artists, through: :artist_genres

  def self.select_options
    self.all.collect do |genre|
      [genre.name.capitalize, genre.id]
    end
  end
end
