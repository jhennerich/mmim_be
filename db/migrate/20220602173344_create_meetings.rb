class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :location_name
      t.string :location_address
      t.string :host_name
      t.string :guest_name

      t.timestamps
    end
  end
end
