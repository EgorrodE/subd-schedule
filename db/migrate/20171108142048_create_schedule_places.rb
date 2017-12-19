class CreateSchedulePlaces < ActiveRecord::Migration
  def change
    create_table :schedule_places do |t|
      t.timestamp :start_time, null: false
      t.timestamp :end_time, null: false
      t.integer :weekday_id, index: true, null: false

      t.timestamps null: false
    end
  end
end
