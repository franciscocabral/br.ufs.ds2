class FuncionariosController < ApplicationController
  include ApplicationHelper
  before_action only: [:new, :create, :index, :update, :destroy] do redirecionar_privilegio(0) end
  before_action :privilegio_funcionario, only: [:show, :edit] 
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]

  # GET /funcionarios
  # GET /funcionarios.json
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  def demitir
    @funcionario = Funcionario.find(params[:id])
    @funcionario.ativo = false
    respond_to do |format|
      if @funcionario.update(@funcionario.attributes)
        format.html { redirect_to @funcionario, notice: 'funcionario was successfully fired.' }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    if (params[funcionarios_search_path].nil? ||
        params[funcionarios_search_path][:nome].empty?)
      nome = nil
    else
      nome = params[funcionarios_search_path][:nome]
    end
    if nome != nil
      @funcionarios = Funcionario.where("nome like '#{nome}'")
    else
      @funcionarios = Funcionario.all
    end
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, notice: 'Funcionario was successfully created.' }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: 'funcionario was successfully updated.' }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: 'Funcionario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def privilegio_funcionario
		redirecionar_privilegio(0) if(Funcionario.find(params[:id]) != current_funcionario)
	end
	# Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      params.require(:funcionario).permit(:nome, :cpf, :cidade, :estado, :num, :endereco, :telefone, :salario, :dataContratacao, :ativo, :turno, :login, :password, :password_confirmation, :nivelAcesso)
    end
end
