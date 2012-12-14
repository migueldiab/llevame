class ViajesController < ApplicationController

  def cargar

    @viajes = Viaje.all

    render :json => @viajes, :status => 200

  end

  # GET /viajes
  # GET /viajes.json
  def index
    @viajes = Viaje.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @viajes }
    end
  end

  # GET /viajes/1
  # GET /viajes/1.json
  def show
    @viaje = Viaje.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @viaje }
    end
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

  # GET /viajes/1/edit
  def edit
    @viaje = Viaje.find(params[:id])
  end

  # POST /viajes
  # POST /viajes.json
  def create
    @viaje = Viaje.new(params[:viaje])

    respond_to do |format|
      if @viaje.save
        format.html { redirect_to @viaje, notice: 'Viaje was successfully created.' }
        format.json { render json: @viaje, status: :created, location: @viaje }
      else
        format.html { render action: "new" }
        format.json { render json: @viaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /viajes/1
  # PUT /viajes/1.json
  def update
    @viaje = Viaje.find(params[:id])

    respond_to do |format|
      if @viaje.update_attributes(params[:viaje])
        format.html { redirect_to @viaje, notice: 'Viaje was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @viaje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viajes/1
  # DELETE /viajes/1.json
  def destroy
    @viaje = Viaje.find(params[:id])
    @viaje.destroy

    respond_to do |format|
      format.html { redirect_to viajes_url }
      format.json { head :no_content }
    end
  end
end
