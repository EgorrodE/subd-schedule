class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :students_quantity
      t.integer :teacher_id, index: true, null: false
      t.integer :subject_id, index: true, null: false
      t.integer :classroom_id, index: true, null: false
      t.integer :schedule_place_id, index: true, null: false

      t.timestamps null: false
    end
  end
end
