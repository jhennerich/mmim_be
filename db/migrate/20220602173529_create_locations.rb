class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :meeting, foreign_key: true
      t.string :place_id
      t.string :name
      t.string :address
      t.float :rating
      t.string :img_url
      t.string :price_range

      t.timestamps
    end
  end
end
