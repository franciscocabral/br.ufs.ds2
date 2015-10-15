require 'test_helper'

class VendesControllerTest < ActionController::TestCase
  setup do
    @vende = vende(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vende)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vende" do
    assert_difference('Vende.count') do
      post :create, vende: { data: @vende.data, idFornecedor: @vende.idFornecedor, idItem: @vende.idItem, idVende: @vende.idVende, valor: @vende.valor }
    end

    assert_redirected_to vende_path(assigns(:vende))
  end

  test "should show vende" do
    get :show, id: @vende
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vende
    assert_response :success
  end

  test "should update vende" do
    patch :update, id: @vende, vende: { data: @vende.data, idFornecedor: @vende.idFornecedor, idItem: @vende.idItem, idVende: @vende.idVende, valor: @vende.valor }
    assert_redirected_to vende_path(assigns(:vende))
  end

  test "should destroy vende" do
    assert_difference('Vende.count', -1) do
      delete :destroy, id: @vende
    end

    assert_redirected_to vendes_path
  end
end
