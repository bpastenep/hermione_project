class RdaGeneralsController < ApplicationController
  before_action :set_rda_general, only: [:show, :edit, :update, :destroy]

  # GET /rda_generals
  # GET /rda_generals.json
  def index
    @rda_generals = RdaGeneral.all
  end

  # GET /rda_generals/1
  # GET /rda_generals/1.json
  def show
  end

  # GET /rda_generals/new
  def new
    @rda_general = RdaGeneral.new
  end

  # GET /rda_generals/1/edit
  def edit
  end

  # POST /rda_generals
  # POST /rda_generals.json
  def create
    @rda_general = RdaGeneral.new(rda_general_params)
    programa = Program.last
    puts programa.nombre
    puts "PROBAAANDO"
    @rda_general.program_id = programa.id
    respond_to do |format|
      if @rda_general.save
        format.html { redirect_to @rda_general, notice: 'Rda general was successfully created.' }
        format.json { render :show, status: :created, location: @rda_general }
      else
        format.html { render :new }
        format.json { render json: @rda_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rda_generals/1
  # PATCH/PUT /rda_generals/1.json
  def update
    respond_to do |format|
      if @rda_general.update(rda_general_params)
        format.html { redirect_to @rda_general, notice: 'Rda general was successfully updated.' }
        format.json { render :show, status: :ok, location: @rda_general }
      else
        format.html { render :edit }
        format.json { render json: @rda_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rda_generals/1
  # DELETE /rda_generals/1.json
  def destroy
    @rda_general.destroy
    respond_to do |format|
      format.html { redirect_to rda_generals_url, notice: 'Rda general was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rda_general
      @rda_general = RdaGeneral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rda_general_params
      params.require(:rda_general).permit(:descripcion)
    end
end
