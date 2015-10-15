require 'test_helper'

class ComponentesProdutosControllerTest < ActionController::TestCase
  setup do
    @componentes_produto = componentes_produto(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:componentes_produto)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create componentes_produto" do
    assert_difference('ComponentesProduto.count') do
      post :create, componentes_produto: { idCompoe: @componentes_produto.idCompoe, idItem: @componentes_produto.idItem, idProduto: @componentes_produto.idProduto, quantidade: @componentes_produto.quantidade }
    end

    assert_redirected_to componentes_produto_path(assigns(:componentes_produto))
  end

  test "should show componentes_produto" do
    get :show, id: @componentes_produto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @componentes_produto
    assert_response :success
  end

  test "should update componentes_produto" do
    patch :update, id: @componentes_produto, componentes_produto: { idCompoe: @componentes_produto.idCompoe, idItem: @componentes_produto.idItem, idProduto: @componentes_produto.idProduto, quantidade: @componentes_produto.quantidade }
    assert_redirected_to componentes_produto_path(assigns(:componentes_produto))
  end

  test "should destroy componentes_produto" do
    assert_difference('ComponentesProduto.count', -1) do
      delete :destroy, id: @componentes_produto
    end

    assert_redirected_to componentes_produtos_path
  end
end
