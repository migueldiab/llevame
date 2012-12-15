require 'test_helper'

class SegurosControllerTest < ActionController::TestCase
  setup do
    @seguro = seguros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguro" do
    assert_difference('Seguro.count') do
      post :create, seguro: { nombre: @seguro.nombre }
    end

    assert_redirected_to seguro_path(assigns(:seguro))
  end

  test "should show seguro" do
    get :show, id: @seguro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seguro
    assert_response :success
  end

  test "should update seguro" do
    put :update, id: @seguro, seguro: { nombre: @seguro.nombre }
    assert_redirected_to seguro_path(assigns(:seguro))
  end

  test "should destroy seguro" do
    assert_difference('Seguro.count', -1) do
      delete :destroy, id: @seguro
    end

    assert_redirected_to seguros_path
  end
end
