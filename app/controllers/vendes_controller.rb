class VendesController < ApplicationController
  before_action :set_vende, only: [:show, :edit, :update, :destroy]

  # GET /vendes
  # GET /vendes.json
  def index
    @vendes = Vende.all
  end

  # GET /vendes/1
  # GET /vendes/1.json
  def show
  end

  # GET /vendes/new
  def new
    @vende = Vende.new
  end

  # GET /vendes/1/edit
  def edit
  end

  # POST /vendes
  # POST /vendes.json
  def create
    @vende = Vende.new(vende_params)

    respond_to do |format|
      if @vende.save
        format.html { redirect_to @vende, notice: 'Vende was successfully created.' }
        format.json { render :show, status: :created, location: @vende }
      else
        format.html { render :new }
        format.json { render json: @vende.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendes/1
  # PATCH/PUT /vendes/1.json
  def update
    respond_to do |format|
      if @vende.update(vende_params)
        format.html { redirect_to @vende, notice: 'Vende was successfully updated.' }
        format.json { render :show, status: :ok, location: @vende }
      else
        format.html { render :edit }
        format.json { render json: @vende.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendes/1
  # DELETE /vendes/1.json
  def destroy
    @vende.destroy
    respond_to do |format|
      format.html { redirect_to vendes_url, notice: 'Vende was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vende
      @vende = Vende.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vende_params
      params.require(:vende).permit(:idVende, :idFornecedor, :idItem, :data, :valor)
    end
end
