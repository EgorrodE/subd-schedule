class DeleteClassesPerWeekForSubjectsTeacher < ActiveRecord::Migration
  def change
    remove_column :subjects_teachers, :classes_per_week
  end
end
