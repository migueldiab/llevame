define ['common/DateTime'], (DateTime) ->
  class Viaje

    desde: null
    hacia: null
    fecha: null
    hora: null

    constructor: ->

    toString: ->
      "Viaje #{desde} - #{hacia}"

    @parseJSON: (jsonViaje) ->
      unViaje = new Viaje()
      unViaje.desde = jsonViaje.ciudadOrigen.nombre
      unViaje.hacia = jsonViaje.ciudadDestino.nombre
      unViaje.fecha = jsonViaje.fSalida
      unViaje.hora = jsonViaje.fSalida
      return unViaje