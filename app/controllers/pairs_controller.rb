class PairsController < ApplicationController
  before_action :set_pair, only: [:index, :update, :destroy]

  # GET /pairs
  # GET /pairs.json
  def index
    @grouped_pairs = Pair.all
      .includes(:teacher, :subject, schedule_place: :weekday, classroom: :case)
      .sort_by { |p| p.subject.name }.group_by do |p|
        "#{p.teacher.last_name} #{p.teacher.first_name} #{p.teacher.middle_name}"
      end
    @teachers = Teacher.all.order(:last_name, :first_name)
      .map { |t| ["#{t.last_name} #{t.first_name} #{t.middle_name}", t.id] }
    @subjects = Subject.all.order(:name).map { |s| [s.name, s.id] }
    @classrooms = Classroom.all.includes(:case)
      .sort_by{ |c| "#{c.case.name} - #{c.name}" }
      .map { |c| ["#{c.case.name} - #{c.name}", c.id] }
    @schedule_places = SchedulePlace.all.order(:weekday_id, :start_time)
      .map { |sp| ["#{sp.weekday.name}, #{sp.start_time.strftime('%H:%M')} - #{sp.end_time.strftime('%H:%M')}", sp.id] }

  end

  # POST /pairs
  # POST /pairs.json
  def create
    @pair = Pair.new(pair_params)

    respond_to do |format|
      if @pair.save
        format.html { redirect_to pairs_path }
        format.json { render :show, status: :created, location: @pair }
      else
        format.html { render :new }
        format.json { render json: @pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pairs/1
  # PATCH/PUT /pairs/1.json
  def update
    respond_to do |format|
      if @edit_pair.update(pair_params)
        format.html { redirect_to pairs_path, notice: 'Schedule place was successfully updated.' }
        format.json { render :show, status: :ok, location: @edit_pair }
      else
        format.html { render :edit }
        format.json { render json: @edit_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairs/1
  # DELETE /pairs/1.json
  def destroy
    @edit_pair.destroy
    respond_to do |format|
      format.html { redirect_to pairs_url, notice: 'Schedule place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pair
    @new_pair = Pair.new
    @edit_pair = (params[:id] ? Pair.find(params[:id]) : nil)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pair_params
    params.require(:pair).permit(:students_quantity, :teacher_id, :subject_id, :classroom_id, :schedule_place_id)
  end
end
