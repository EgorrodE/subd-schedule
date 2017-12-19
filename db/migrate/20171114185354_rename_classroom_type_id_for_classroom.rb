class RenameClassroomTypeIdForClassroom < ActiveRecord::Migration
  def change
    rename_column :classrooms, :classrrom_type_id, :classroom_type_id
  end
end
