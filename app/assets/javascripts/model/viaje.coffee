class @Viaje

  vehiculo: null
  desde: null
  hacia: null
  fecha: null
  hora: null
  flexible: null
  paradas: null
  pasaje: null
  animales: null
  peajes: null

  constructor: ->

  toString: ->
    "Viaje #{desde} - #{hacia}"

  @parseJSON: (jsonViaje) ->
    unViaje = new Viaje()
    unViaje.vehiculo = jsonViaje.vehiculo
    unViaje.desde = jsonViaje.ciudadOrigen.nombre
    unViaje.hacia = jsonViaje.ciudadDestino.nombre
    unViaje.fecha = jsonViaje.fSalida
    unViaje.hora = jsonViaje.fSalida
    return unViaje