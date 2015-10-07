require 'test_helper'

class FuncionariosControllerTest < ActionController::TestCase
  setup do
    @funcionario = funcionario(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcionario)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcionario" do
    assert_difference('Funcionario.count') do
      post :create, funcionario: { ativo: @funcionario.ativo, cidade: @funcionario.cidade, cpf: @funcionario.cpf, dataContratacao: @funcionario.dataContratacao, endereco: @funcionario.endereco, estado: @funcionario.estado, login: @funcionario.login, nivelAcesso: @funcionario.nivelAcesso, nome: @funcionario.nome, num: @funcionario.num, password_digest: @funcionario.password_digest, salario: @funcionario.salario, telefone: @funcionario.telefone, turno: @funcionario.turno }
    end

    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should show funcionario" do
    get :show, id: @funcionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcionario
    assert_response :success
  end

  test "should update funcionario" do
    patch :update, id: @funcionario, funcionario: { ativo: @funcionario.ativo, cidade: @funcionario.cidade, cpf: @funcionario.cpf, dataContratacao: @funcionario.dataContratacao, endereco: @funcionario.endereco, estado: @funcionario.estado, login: @funcionario.login, nivelAcesso: @funcionario.nivelAcesso, nome: @funcionario.nome, num: @funcionario.num, password_digest: @funcionario.password_digest, salario: @funcionario.salario, telefone: @funcionario.telefone, turno: @funcionario.turno }
    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should destroy funcionario" do
    assert_difference('Funcionario.count', -1) do
      delete :destroy, id: @funcionario
    end

    assert_redirected_to funcionarios_path
  end
end
