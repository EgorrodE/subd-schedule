class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name, null: false
      t.integer :places_avaliable, null: false
      t.integer :case_id, index: true, null: false
      t.integer :classrrom_type_id, index: true, null: false

      t.timestamps null: false
    end

    add_index :classrooms, [:name, :case_id], unique: true
  end
end
