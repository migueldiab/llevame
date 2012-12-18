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

    salida = "#{params['fecha'][0..9]} #{params['hora'][0..7]}"
    logger.info "Fecha Salida : #{salida}"
    # Input time in format '1999-12-31 11:59 PM'
    # Will only take into account the first 10 characters of fecha
    # and the first 8 characters of hora and join them with a blank space
    @viaje.fSalida=  Date.strptime salida, '%Y-%m-%d %I:%M %p'
    @viaje.fLlegada= @viaje.fSalida

    if @viaje.save
      render :json => @viaje, :status => 201
    else
      response = ['error' => 'Could not save new trip']
      render :json => response, :status => 409
    end

  end

end
