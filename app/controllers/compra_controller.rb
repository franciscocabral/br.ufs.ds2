class CompraController < ApplicationController
  before_action :set_vende, only: [:show, :edit, :update, :destroy]
  before_action :set_item, only: [:item_show, :item_edit, :item_update, :item_destroy]
  
  # GET /vendes
  # GET /vendes.json
  def index
    @vendes = Vende.all
  end

  # GET /vendes/1
  # GET /vendes/1.json
  def show
    @vende = Vende.find([params[:id1], params[:id2], params[:id3]])
  end

  # GET /vendes/new
  def new
    @vende = Vende.new
	@fornecedores = Fornecedor.order(:nome)
	@item = Item.order(:nome)
  end

  # GET /vendes/1/edit
  def edit
    @vende = Vende.find([params[:id1], params[:id2], params[:id3]])
  end

  # POST /vendes
  # POST /vendes.json
  def create
	@vende = Vende.new(vende_params)
	@fornecedores = Fornecedor.order(:nome)
	@item = Item.order(:nome)
    respond_to do |format|
	  if @vende.save
        format.html { redirect_to vende_show_path(@vende.idVende, @vende.idFornecedor, @vende.idItem), notice: 'Vende was successfully created.' }
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
    @vende = Vende.find([params[:id1], params[:id2], params[:id3]])
    respond_to do |format|
      if @vende.update(vende_params)
        format.html { redirect_to vende_show_path(@vende.idVende, @vende.idFornecedor, @vende.idItem), notice: 'Vende was successfully updated.' }
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
    @vende = Vende.find([params[:id1], params[:id2], params[:id3]])
    @vende.destroy
    respond_to do |format|
      format.html { redirect_to vende_index_path, notice: 'Vende was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /items
  # GET /items.json
  def item_index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def item_show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def item_new
    @item = Item.new
  end

  # GET /items/1/edit
  def item_edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def item_create
    @item = Item.new(item_params)
	@item.quantidade = 0
    respond_to do |format|
      if @item.save
        format.html { redirect_to item_index_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def item_update
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_show_path(@item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def item_destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to item_index_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vende
      @vende = Vende.find([params[:id1], params[:id2], params[:id3]])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vende_params
      params.require(:vende).permit(:idFornecedor, :idItem, :data, :valor)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:nome, :marca, :descricao, :quantidade, :quantidadeMinima)
    end
end
