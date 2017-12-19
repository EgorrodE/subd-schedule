class SubjectsController < ApplicationController
  before_action :set_subject, only: [:index, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all.includes(:teachers).order(:name)
    @classroom_types = ClassroomType.all.order(:name)
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @edit_subject.update(subject_params)
        format.html { redirect_to subjects_path, notice: 'Schedule place was successfully updated.' }
        format.json { render :show, status: :ok, location: @edit_subject }
      else
        format.html { render :edit }
        format.json { render json: @edit_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @edit_subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Schedule place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_classroom_type
    ClassroomTypesSubject.create(subject_id: params[:subject_id], classroom_type_id: params[:classroom_type_id])

    redirect_to subjects_path
  end

  def remove_classroom_type
    ClassroomTypesSubject.find_by(subject_id: params[:subject_id], classroom_type_id: params[:classroom_type_id]).delete

    redirect_to subjects_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @new_subject = Subject.new
    @edit_subject = (params[:id] ? Subject.find(params[:id]) : nil)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subject_params
    params.require(:subject).permit(:name)
  end
end
