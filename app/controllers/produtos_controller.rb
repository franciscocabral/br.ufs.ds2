# coding: utf-8
require 'json'
class ProdutosController < ApplicationController
  include ApplicationHelper
  before_action only: [:new, :create, :update, :edit, :destroy] do redirecionar_privilegio(0) end
  before_action do redirecionar_privilegio(2) end
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  before_action :set_componentes_produto, only: [:show, :edit, :update, :destroy]

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all.order :nome
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
    @componentes_produto = @produto.componentes_produtos
    @items = Item.all
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
    @componentes_produto = @produto.componentes_produtos
    puts "[Aqui]"
    puts "linha #{@componentes_produto.class}"
    puts"[Nao aqui]"
    @items = Item.all
  end

  # POST /produtos
  # POST /produtos.json
  def create
    Produto.transaction do
      @produto = Produto.new(produto_params)
      items = JSON.parse(params["items"])
      respond_to do |format|
        if @produto.save
          items.each do |it|
            componentes_produto = ComponentesProduto.new
            componentes_produto.idProduto = @produto.idProduto
            componentes_produto.idItem = it["id"]
            componentes_produto.quantidade = it["quantidade"]
            componentes_produto.save
          end
          format.html { redirect_to @produto, notice: 'Produto criado com sucesso.' }
          format.json { render :show, status: :created, location: @produto }
        else
          format.html { render :new }
          format.json { render json: @produto.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    Produto.transaction do
      @produto =  Produto.find(params[:id])
      items = JSON.parse(params["items"])      
      respond_to do |format|
        if @produto.update(produto_params)
          items.each do |it|
            if !@produto.componentes_produtos.any? {|c| c["idItem"] == it["id"]}
              componentes_produto = ComponentesProduto.new
              componentes_produto.idProduto = @produto.idProduto
              componentes_produto.idItem = it["id"]
              componentes_produto.quantidade = it["quantidade"]
              componentes_produto.save
            end
          end

          @produto.componentes_produtos.each do |cp|
            if !items.any? {|i| i["id"] == cp["idItem"]}
              cp.destroy
            end
          end
          
          format.html { redirect_to @produto, notice: 'Produto foi atualizado com sucesso.' }
          format.json { render :show, status: :ok, location: @produto }
        else
          format.html { render :edit }
          format.json { render json: @produto.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy

    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto foi deletado com sucesso.' }
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

  def componentes_adicionar
  end


  # POST /componentes_produtos
  # POST /componentes_produtos.json
  def componentes_create
    puts "Começa"
    puts params
    teste = JSON.parse(params["items"])
    # @lista_componentes.push({idItem: params['componentes_produto']['idItem'],
    #                          quantidade: params['componentes_produto']['quantidade']})
    # @lista_componentes.each do |x|
    #   puts "Valor: #{x} ."
    # end
    puts "termina"

    respond_to do |format|
        format.html { redirect_to :back, notice: 'Componente criado com sucesso.' }
        #format.json { render :componentes_show, status: :created, location: @componentes_produto }
    end
    
    # @componentes_produto = ComponentesProduto.new(componentes_produto_params)

    # respond_to do |format|
    #   if @componentes_produto.save
    #     format.html { redirect_to :back, notice: 'Componente criado com sucesso.' }
    #     format.json { render :show, status: :created, location: @componentes_produto }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @componentes_produto.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /componentes_produtos/1
  # PATCH/PUT /componentes_produtos/1.json
  def componentes_update
    respond_to do |format|
      if @componentes_produto.update(componentes_produto_params)
        format.html { redirect_to @componentes_produto, notice: 'Componente foi atualizado com sucesso' }
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
    @componentes_produto = ComponentesProduto.find(params[:id])
    @componentes_produto.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Componente foi deletado com sucesso.' }
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
