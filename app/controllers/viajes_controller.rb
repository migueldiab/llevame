class ViajesController < ApplicationController

  def proximos
    @viajes = Viaje.where("fSalida >= ?", Date.today).limit(10)
    if (@viajes.empty?)
      response = ['error' => 'No Trips in DB']
      status = 204
    else
      response = @viajes
      status = 200
    end
    render :json => response, :status => status

  end

  def cargar
    @viajes = Viaje.all
    if (@viajes.empty?)
      response = ['error' => 'No Trips in DB']
      status = 204
    else
      response = @viajes
      status = 200
    end
    render :json => response, :status => status
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
    @viaje.fSalida=  Date.strptime salida, '%d/%m/%Y %I:%M %p'
    logger.info "Fecha : #{@viaje.fSalida}"
    @viaje.fLlegada= @viaje.fSalida

    if @viaje.save
      render :json => @viaje, :status => 201
    else
      response = ['error' => 'Could not save new trip']
      render :json => response, :status => 409
    end

  end

end
