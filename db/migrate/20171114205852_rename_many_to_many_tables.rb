class RenameManyToManyTables < ActiveRecord::Migration
  def change
    rename_table :classroom_type_subjects, :classroom_types_subjects
    rename_table :subject_teachers, :subjects_teachers
  end
end
