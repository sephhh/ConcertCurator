class CreateArtistEvents < ActiveRecord::Migration
  def change
    create_table :artist_events do |t|
      t.belongs_to :artist
      t.belongs_to :event

      t.timestamps null: false
    end
  end
end
