class VehiculosController < ApplicationController

  # GET /vehiculos/new
  # GET /vehiculos/new.json
  def new
    @vehiculo = Vehiculo.new

    modelo = Modelo.find_or_create_by_nombre(params['modelo'])
    #marca = Fabricante.find_or_create_by_nombre(params['marca'])
    @vehiculo.nombre = params['nombre']


    if @vehiculo.save
      render :json => @vehiculo, :status => 201
    else
      response = ['error' => 'Could not save new vehicle']
      render :json => response, :status => 409
    end
  end

end
