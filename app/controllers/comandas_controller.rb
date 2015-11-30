class ComandasController < ApplicationController
  include ApplicationHelper
  before_action do redirecionar_privilegio(1) end
  before_action :set_comanda, only: [:show, :edit, :update, :encerrar, :new_pedido]
  before_action :set_pedido, only: [:cancelar_pedido,:finalizar_pedido]

  # GET /comandas
  # GET /comandas.json
  def index
    @comandas = Comanda.all
    @comanda = Comanda.new
  end

  # GET /comandas/1
  # GET /comandas/1.json
  def show
    @pedido = Pedido.new
  end

  # GET /comandas/new
  def new
    @comanda = Comanda.new
  end

  # GET /comandas/1/cancelar_pedido
  def finalizar_pedido
    comanda = @pedido.comanda
    @pedido.dataFinalizacao = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @pedido.save
    respond_to do |format|
      format.html { redirect_to comanda, notice: 'Pedido concluído com Sucesso' }
      format.json { head :no_content }
    end
  end
  # GET /comandas/1/cancelar_pedido
  def cancelar_pedido
    comanda = @pedido.comanda
    @pedido.cancelado = true

    if !@pedido.is_finalizado
      componentes = Produto.find(@pedido.idProduto).componentes_produtos
      componentes.each do |componente|
        componente.item.quantidade += componente.quantidade
        componente.item.save
      end
    end

    @pedido.save
    respond_to do |format|
      format.html { redirect_to comanda, notice: 'Pedido cancelado com Sucesso' }
      format.json { head :no_content }
    end
  end

  # GET /comandas/1/edit
  def edit
  end


  # POST /comandas/1/new_pedido
  def new_pedido
    @pedido = Pedido.new
    @pedido.idcomanda = @comanda.idcomanda
    @pedido.idFuncionario = @comanda.idFuncionario
    @pedido.idProduto = params[:pedido][:idProduto]
    @pedido.dataPedido = Time.now.strftime("%Y-%m-%d %H:%M:%S")

    allOkay = true
    componentes = Produto.find(@pedido.idProduto).componentes_produtos
    componentes.each do |componente|
      allOkay = allOkay && (componente.quantidade <= componente.item.quantidade)
    end
    if allOkay
      componentes.each do |componente|
        componente.item.quantidade -= componente.quantidade
        componente.item.save
      end
    end

    respond_to do |format|
      if allOkay && @pedido.save
        format.html { redirect_to @comanda, notice: 'Pedido adicionado com Sucesso' }
        format.json { render :show, status: :created, location: @comanda }
      else
        format.html { redirect_to @comanda, notice: @pedido.errors }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end


  # POST /comandas
  # POST /comandas.json
  def create
    @comanda = Comanda.new
    @comanda.idFuncionario = current_funcionario.id
    @comanda.mesa = params[:comanda][:mesa]
    @comanda.dataAbertura = Time.now.strftime("%Y-%m-%d %H:%M:%S")

    respond_to do |format|
      if @comanda.save
        format.html { redirect_to @comanda, notice: 'Comanda criada com Sucesso' }
        format.json { render :show, status: :created, location: @comanda }
      else
        format.html { render :new }
        format.json { render json: @comanda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comandas/1
  # PATCH/PUT /comandas/1.json
  def update
    respond_to do |format|
      if @comanda.update(comanda_params)
        format.html { redirect_to @comanda, notice: 'Comanda was successfully updated.' }
        format.json { render :show, status: :ok, location: @comanda }
      else
        format.html { render :edit }
        format.json { render json: @comanda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comandas/1
  # DELETE /comandas/1.json
  def encerrar
    @comanda.dataEncerramento = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @comanda.valorFinal = params[:comanda][:valorFinal]
    @comanda.save
    respond_to do |format|
      format.html { redirect_to comandas_url, notice: 'Comanda encerrada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comanda
      @comanda = Comanda.find(params[:id])
    end

    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comanda_params
      params.require(:comanda).permit(:idcomanda, :idFuncionario, :mesa, :dataAbertura, :dataEncerramento, :valorFinal)
    end

end
