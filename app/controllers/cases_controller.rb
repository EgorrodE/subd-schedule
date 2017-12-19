class CasesController < ApplicationController
  before_action :set_case, only: [:index, :update, :destroy]

  # GET /cases
  # GET /cases.json
  def index
    @cases = Case.all.order(:name)
  end

  # POST /cases
  # POST /cases.json
  def create
    @case = Case.new(case_params)

    respond_to do |format|
      if @case.save
        format.html { redirect_to cases_path }
        format.json { render :show, status: :created, location: @case }
      else
        format.html { render :new }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
  def update
    respond_to do |format|
      if @edit_case.update(case_params)
        format.html { redirect_to cases_path, notice: 'Schedule place was successfully updated.' }
        format.json { render :show, status: :ok, location: @edit_case }
      else
        format.html { render :edit }
        format.json { render json: @edit_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    @edit_case.destroy
    respond_to do |format|
      format.html { redirect_to cases_url, notice: 'Schedule place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_case
    @new_case = Case.new
    @edit_case = (params[:id] ? Case.find(params[:id]) : nil)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def case_params
    params.require(:case).permit(:name)
  end
end
