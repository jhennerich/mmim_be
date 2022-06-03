class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.integer :status, default: 0
      t.string :place_id

      t.timestamps
    end
  end
end
