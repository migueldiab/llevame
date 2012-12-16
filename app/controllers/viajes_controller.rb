class ViajesController < ApplicationController

  def cargar
    @viajes = Viaje.all
    temp = @viajes.second
    logger.info "JSON : #{temp.as_json}"
    logger.info "Trips : #{temp.ciudadDestino.to_s}"
    logger.info "Trips : #{temp.idCiudadDestino.to_s}"
    render :json => @viajes, :status => 200
  end

  # GET /viajes/new
  # GET /viajes/new.json
  def new
    ciudadOrigen = Ciudad.find_or_create_by_nombre(params['desde'])
    ciudadDestino = Ciudad.find_or_create_by_nombre(params['hacia'])

    @viaje = Viaje.new
    @viaje.idCiudadOrigen  = ciudadOrigen.id
    @viaje.idCiudadDestino= ciudadDestino.id

    @viaje.fSalida=  Date.strptime params['fecha'], '%d-%m-%Y'
    @viaje.fLlegada=  Date.strptime params['fecha'], '%d-%m-%Y'

    if @viaje.save
      render :json => @viaje, :status => 201
    else
      response = ['error' => 'Could not save new trip']
      render :json => response, :status => 409
    end

  end

end
