require 'test_helper'

class AuxiliosControllerTest < ActionController::TestCase
  setup do
    @auxilio = auxilios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auxilios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auxilio" do
    assert_difference('Auxilio.count') do
      post :create, auxilio: { logo: @auxilio.logo, nombre: @auxilio.nombre }
    end

    assert_redirected_to auxilio_path(assigns(:auxilio))
  end

  test "should show auxilio" do
    get :show, id: @auxilio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auxilio
    assert_response :success
  end

  test "should update auxilio" do
    put :update, id: @auxilio, auxilio: { logo: @auxilio.logo, nombre: @auxilio.nombre }
    assert_redirected_to auxilio_path(assigns(:auxilio))
  end

  test "should destroy auxilio" do
    assert_difference('Auxilio.count', -1) do
      delete :destroy, id: @auxilio
    end

    assert_redirected_to auxilios_path
  end
end
