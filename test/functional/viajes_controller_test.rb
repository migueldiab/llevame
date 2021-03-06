require 'test_helper'

class ViajesControllerTest < ActionController::TestCase
  setup do
    @viaje = viajes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:viajes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create viaje" do
    assert_difference('Viaje.count') do
      post :create, viaje: { animales: @viaje.animales, equipaje: @viaje.equipaje, fLlegada: @viaje.fLlegada, fSalida: @viaje.fSalida, idCiudadDestino: @viaje.idCiudadDestino, idCiudadOrigen: @viaje.idCiudadOrigen, idEstado: @viaje.idEstado, idUsuario: @viaje.idUsuario, kms: @viaje.kms, paradas: @viaje.paradas, pasaje: @viaje.pasaje, peajes: @viaje.peajes }
    end

    assert_redirected_to viaje_path(assigns(:viaje))
  end

  test "should show viaje" do
    get :show, id: @viaje
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @viaje
    assert_response :success
  end

  test "should update viaje" do
    put :update, id: @viaje, viaje: { animales: @viaje.animales, equipaje: @viaje.equipaje, fLlegada: @viaje.fLlegada, fSalida: @viaje.fSalida, idCiudadDestino: @viaje.idCiudadDestino, idCiudadOrigen: @viaje.idCiudadOrigen, idEstado: @viaje.idEstado, idUsuario: @viaje.idUsuario, kms: @viaje.kms, paradas: @viaje.paradas, pasaje: @viaje.pasaje, peajes: @viaje.peajes }
    assert_redirected_to viaje_path(assigns(:viaje))
  end

  test "should destroy viaje" do
    assert_difference('Viaje.count', -1) do
      delete :destroy, id: @viaje
    end

    assert_redirected_to viajes_path
  end
end
