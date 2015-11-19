class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  before_action :set_componentes_produto, only: [:show, :edit, :update, :destroy]

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
    @componentes_produto = ComponentesProduto.new
    @items = Item.all
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto was successfully created.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
    
# Controlador Componente Protudo.

  # GET /componentes_produtos
  # GET /componentes_produtos.json
  def componentes_index
    @componentes_produtos = ComponentesProduto.all
  end

  # GET /componentes_produtos/1
  # GET /componentes_produtos/1.json
  def componentes_show
  end

  # GET /componentes_produtos/new
  def componentes_new
    @componentes_produto = ComponentesProduto.new
  end

  # GET /componentes_produtos/1/edit
  def componentes_edit
  end

  # POST /componentes_produtos
  # POST /componentes_produtos.json
  def componentes_create
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
  def componentes_update
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
  def componentes_destroy
    @componentes_produto.destroy
    respond_to do |format|
      format.html { redirect_to componentes_produtos_url, notice: 'Componentes produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_componentes_produto
      #@componentes_produto = ComponentesProduto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def componentes_produto_params
      params.require(:componentes_produto).permit(:idCompoe, :idProduto, :idItem, :quantidade)
    end
    
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome, :valor, :descricao)
    end
end
