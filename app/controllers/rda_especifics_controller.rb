class RdaEspecificsController < ApplicationController
  before_action :set_rda_especific, only: [:show, :edit, :update, :destroy]

  # GET /rda_especifics
  # GET /rda_especifics.json
  def index
    @rda_especifics = RdaEspecific.all
  end

  # GET /rda_especifics/1
  # GET /rda_especifics/1.json
  def show
  end

  # GET /rda_especifics/new
  def new
    @rda_especific = RdaEspecific.new
    @rda_g = RdaGeneral.all
  end

  # GET /rda_especifics/1/edit
  def edit
    @rda_g = RdaGeneral.all
  end

  # POST /rda_especifics
  # POST /rda_especifics.json
  def create
    @rda_especific = RdaEspecific.new(rda_especific_params)

    respond_to do |format|
      if @rda_especific.save
        format.html { redirect_to @rda_especific, notice: 'Rda especific was successfully created.' }
        format.json { render :show, status: :created, location: @rda_especific }
      else
        format.html { render :new }
        format.json { render json: @rda_especific.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rda_especifics/1
  # PATCH/PUT /rda_especifics/1.json
  def update
    respond_to do |format|
      if @rda_especific.update(rda_especific_params)
        format.html { redirect_to @rda_especific, notice: 'Rda especific was successfully updated.' }
        format.json { render :show, status: :ok, location: @rda_especific }
      else
        format.html { render :edit }
        format.json { render json: @rda_especific.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rda_especifics/1
  # DELETE /rda_especifics/1.json
  def destroy
    @rda_especific.destroy
    respond_to do |format|
      format.html { redirect_to rda_especifics_url, notice: 'Rda especific was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rda_especific
      @rda_especific = RdaEspecific.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rda_especific_params
      params.require(:rda_especific).permit(:descripcion, :rda_general_id)
    end
end
