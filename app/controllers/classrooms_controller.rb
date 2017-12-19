class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:index, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @grouped_classrooms = Classroom.all.includes(:classroom_type, :case).order(:name).group_by { |c| c.case.name }
    @classroom_types = ClassroomType.all.order(:name).map { |ct| [ct.name, ct.id] }
    @cases = Case.all.order(:name).map { |wd| [wd.name, wd.id] }
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to classrooms_path }
        format.json { render :show, status: :created, location: @classroom }
      else
        format.html { render :new }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    respond_to do |format|
      if @edit_classroom.update(classroom_params)
        format.html { redirect_to classrooms_path, notice: 'Schedule place was successfully updated.' }
        format.json { render :show, status: :ok, location: @edit_classroom }
      else
        format.html { render :edit }
        format.json { render json: @edit_classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @edit_classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'Schedule place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_classroom
    @new_classroom = Classroom.new
    @edit_classroom = (params[:id] ? Classroom.find(params[:id]) : nil)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def classroom_params
    params.require(:classroom).permit(:name, :places_avaliable, :case_id, :classroom_type_id)
  end
end
