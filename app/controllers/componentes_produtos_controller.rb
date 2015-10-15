class ComponentesProdutosController < ApplicationController
  before_action :set_componentes_produto, only: [:show, :edit, :update, :destroy]

  # GET /componentes_produtos
  # GET /componentes_produtos.json
  def index
    @componentes_produtos = ComponentesProduto.all
  end

  # GET /componentes_produtos/1
  # GET /componentes_produtos/1.json
  def show
  end

  # GET /componentes_produtos/new
  def new
    @componentes_produto = ComponentesProduto.new
  end

  # GET /componentes_produtos/1/edit
  def edit
  end

  # POST /componentes_produtos
  # POST /componentes_produtos.json
  def create
    @componentes_produto = ComponentesProduto.new(componentes_produto_params)

    respond_to do |format|
      if @componentes_produto.save
        format.html { redirect_to @componentes_produto, notice: 'Componentes produto was successfully created.' }
        format.json { render :show, status: :created, location: @componentes_produto }
      else
        format.html { render :new }
        format.json { render json: @componentes_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /componentes_produtos/1
  # PATCH/PUT /componentes_produtos/1.json
  def update
    respond_to do |format|
      if @componentes_produto.update(componentes_produto_params)
        format.html { redirect_to @componentes_produto, notice: 'Componentes produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @componentes_produto }
      else
        format.html { render :edit }
        format.json { render json: @componentes_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /componentes_produtos/1
  # DELETE /componentes_produtos/1.json
  def destroy
    @componentes_produto.destroy
    respond_to do |format|
      format.html { redirect_to componentes_produtos_url, notice: 'Componentes produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_componentes_produto
      @componentes_produto = ComponentesProduto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def componentes_produto_params
      params.require(:componentes_produto).permit(:idCompoe, :idProduto, :idItem, :quantidade)
    end
end
