require 'test_helper'

class FornecedorsControllerTest < ActionController::TestCase
  setup do
    @fornecedor = fornecedor(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fornecedor)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fornecedor" do
    assert_difference('Fornecedor.count') do
      post :create, fornecedor: { cidade: @fornecedor.cidade, cnpj: @fornecedor.cnpj, endereco: @fornecedor.endereco, estado: @fornecedor.estado, nome: @fornecedor.nome, num: @fornecedor.num, telefone: @fornecedor.telefone }
    end

    assert_redirected_to fornecedor_path(assigns(:fornecedor))
  end

  test "should show fornecedor" do
    get :show, id: @fornecedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fornecedor
    assert_response :success
  end

  test "should update fornecedor" do
    patch :update, id: @fornecedor, fornecedor: { cidade: @fornecedor.cidade, cnpj: @fornecedor.cnpj, endereco: @fornecedor.endereco, estado: @fornecedor.estado, nome: @fornecedor.nome, num: @fornecedor.num, telefone: @fornecedor.telefone }
    assert_redirected_to fornecedor_path(assigns(:fornecedor))
  end

  test "should destroy fornecedor" do
    assert_difference('Fornecedor.count', -1) do
      delete :destroy, id: @fornecedor
    end

    assert_redirected_to fornecedors_path
  end
end
