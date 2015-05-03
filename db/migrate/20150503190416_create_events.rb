class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :seat_geek_id
      t.integer :listing_count
      t.float :average_price
      t.float :lowest_price
      t.float :highest_price
      t.string :title
      t.datetime :datetime_local
      t.timestamps null: false
      t.belongs_to :venue
    end
  end
end
