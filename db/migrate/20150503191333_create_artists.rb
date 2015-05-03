class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.integer :event_count
      t.string :name
      t.integer :seat_geek_id

      t.timestamps null: false
    end
  end
end
