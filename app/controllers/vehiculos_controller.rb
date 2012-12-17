class VehiculosController < ApplicationController
  include SessionHelper

  def new

    if (current_user)
      @vehiculo = Vehiculo.new

      modelo = Modelo.find_or_create_by_nombre(params['modelo'])
      if (modelo)
        if (params['marca'] && !modelo.fabricante)
          modelo.fabricante = Fabricante.find_or_create_by_nombre(params['marca'])
        elsif (params['marca'])
          if (modelo.fabricante.nombre != params['marca'])
            # Diferente Fabricante que en la BD
          else
            # Igual a la BD
          end
        end
      end

      if (params['auxilio'])
        auxilio = Auxilio.find_or_create_by_nombre(params['auxilio'])
      end

      if (params['seguro'])
        seguro = Seguro.find_or_create_by_nombre(params['seguro'])
      end

      #marca = Fabricante.find_or_create_by_nombre(params['marca'])
      @vehiculo.nombre = params['nombre']
      @vehiculo.modelo = modelo
      @vehiculo.color = params['color']
      @vehiculo.auxilio = auxilio
      @vehiculo.seguro = seguro
      @vehiculo.puertas = params['puertas']
      @vehiculo.maxPasajeros = params['maxPasajeros']
      @vehiculo.usuario = current_user

      if @vehiculo.save
        render :json => @vehiculo, :status => 201
      else
        response = ['error' => 'Could not save new vehicle']
        render :json => response, :status => 409
      end
    else
      # Session Expired or no user
    end


  end

  def findAll
    if (current_user)
      @vehiculos = Vehiculo.find_all_by_idUsuario(current_user.id)
      render :json => @vehiculos, :status => 200
    else
      # Session Expired or no user
    end
  end

end
