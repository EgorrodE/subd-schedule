class SchedulePlacesController < ApplicationController
  before_action :set_schedule_place, only: [:index, :update, :destroy]

  # GET /schedule_places
  # GET /schedule_places.json
  def index
    @grouped_schedule_places = SchedulePlace.all
    .order(:weekday_id, :start_time).group_by{ |sp| sp.weekday.name }
    @weekdays = Weekday.all.map { |wd| [wd.name, wd.id] }
  end

  # POST /schedule_places
  # POST /schedule_places.json
  def create
    @schedule_place = SchedulePlace.new(schedule_place_params)

    respond_to do |format|
      if @schedule_place.save
        format.html { redirect_to schedule_places_path }
        format.json { render :show, status: :created, location: @schedule_place }
      else
        format.html { render :new }
        format.json { render json: @schedule_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_places/1
  # PATCH/PUT /schedule_places/1.json
  def update
    respond_to do |format|
      if @edit_schedule_place.update(schedule_place_params)
        format.html { redirect_to schedule_places_path, notice: 'Schedule place was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_place }
      else
        format.html { render :edit }
        format.json { render json: @schedule_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_places/1
  # DELETE /schedule_places/1.json
  def destroy
    @edit_schedule_place.destroy
    respond_to do |format|
      format.html { redirect_to schedule_places_url, notice: 'Schedule place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_schedule_place
    @new_schedule_place = SchedulePlace.new
    @edit_schedule_place = (params[:id] ? SchedulePlace.find(params[:id]) : nil)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def schedule_place_params
    params.require(:schedule_place).permit(:weekday_id, :start_time, :end_time)
      .merge(
        "start_time(1i)"=>"1",
        "start_time(2i)"=>"1",
        "start_time(3i)"=>"1",
        "end_time(1i)"=>"1",
        "end_time(2i)"=>"1",
        "end_time(3i)"=>"1"
      )
  end
end
