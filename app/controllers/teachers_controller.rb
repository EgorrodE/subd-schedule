class TeachersController < ApplicationController
  before_action :set_teacher, only: [:index, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all.order(:last_name, :first_name, :middle_name)
    @subjects = Subject.all.includes(:teachers).order(:name)
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teachers_path }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @edit_teacher.update(teacher_params)
        format.html { redirect_to teachers_path, notice: 'Schedule place was successfully updated.' }
        format.json { render :show, status: :ok, location: @edit_teacher }
      else
        format.html { render :edit }
        format.json { render json: @edit_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @edit_teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Schedule place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def not_work_on_monday_and_thursday
    @teachers = Teacher.find_by_sql("
      SELECT distinct * FROM teachers
      WHERE teachers.id NOT IN (
        SELECT distinct teachers.id FROM teachers
          INNER JOIN pairs ON pairs.teacher_id = teachers.id
          INNER JOIN schedule_places ON schedule_places.id = pairs.schedule_place_id
          WHERE schedule_places.weekday_id IN (1, 4)
      )
    ")
  end

  def find_by_weekday_and_classroom
    @teachers = if params[:classroom_name] && params[:weekday_id]
      Teacher.find_by_sql("
        SELECT distinct   teachers.* FROM teachers
          INNER JOIN pairs ON pairs.teacher_id = teachers.id
          INNER JOIN classrooms ON classrooms.id = pairs.classroom_id
          INNER JOIN schedule_places ON schedule_places.id = pairs.schedule_place_id
          WHERE classrooms.name = #{params[:classroom_name]}
          AND schedule_places.weekday_id = #{params[:weekday_id]}
      ")
    else
      []
    end

    @classrooms = Classroom.all.pluck(:name).uniq.sort.map { |c| [c,c] }

    @weekdays = Weekday.all.map { |wd| [wd.name, wd.id] }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @new_teacher = Teacher.new
    @edit_teacher = (params[:id] ? Teacher.find(params[:id]) : nil)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_params
    params.require(:teacher).permit(:last_name, :first_name, :middle_name, :subject_id)
  end
end
