class CreateClassroomTypeSubjects < ActiveRecord::Migration
  def change
    create_table :classroom_type_subjects do |t|
      t.integer :classroom_type_id, index: true, null: false
      t.integer :subject_id, index: true, null: false

      t.timestamps null: false
    end

    add_index :classroom_type_subjects, [:classroom_type_id, :subject_id], unique: true, name: 'classroom_type_and_subject_unique'
  end
end
