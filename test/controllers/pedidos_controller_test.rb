require 'test_helper'

class PedidosControllerTest < ActionController::TestCase
  setup do
    @pedido = pedido(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedido)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post :create, pedido: { cancelado: @pedido.cancelado, dataFinalizacao: @pedido.dataFinalizacao, dataPedido: @pedido.dataPedido, idFuncionario: @pedido.idFuncionario, idPedido: @pedido.idPedido, idProduto: @pedido.idProduto, idcomanda: @pedido.idcomanda }
    end

    assert_redirected_to pedido_path(assigns(:pedido))
  end

  test "should show pedido" do
    get :show, id: @pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedido
    assert_response :success
  end

  test "should update pedido" do
    patch :update, id: @pedido, pedido: { cancelado: @pedido.cancelado, dataFinalizacao: @pedido.dataFinalizacao, dataPedido: @pedido.dataPedido, idFuncionario: @pedido.idFuncionario, idPedido: @pedido.idPedido, idProduto: @pedido.idProduto, idcomanda: @pedido.idcomanda }
    assert_redirected_to pedido_path(assigns(:pedido))
  end

  test "should destroy pedido" do
    assert_difference('Pedido.count', -1) do
      delete :destroy, id: @pedido
    end

    assert_redirected_to pedidos_path
  end
end
