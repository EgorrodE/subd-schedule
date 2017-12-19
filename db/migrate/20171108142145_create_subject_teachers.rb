class CreateSubjectTeachers < ActiveRecord::Migration
  def change
    create_table :subject_teachers do |t|
      t.integer :subject_id, index: true, null: false
      t.integer :teacher_id, index: true, null: false
      t.integer :classes_per_week, null: false

      t.timestamps null: false
    end

    add_index :subject_teachers, [:subject_id, :teacher_id], unique: true
  end

end
