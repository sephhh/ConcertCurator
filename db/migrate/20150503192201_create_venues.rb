class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :city
      t.string :name
      t.string :extended_address
      t.string :display_location
      t.string :state
      t.integer :postal_code
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :seat_geek_id

      t.timestamps null: false
    end
  end
end
