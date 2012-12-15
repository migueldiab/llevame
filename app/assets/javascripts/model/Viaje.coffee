define ['common/DateTime'], (DateTime) ->
  class Viaje


    constructor: (@desde, @hacia, @fecha, @hora, @flexible) ->
      console.log "Creating Viaje"
      this.desde = "Montevideo"
      this.hacia = "Punta del Este"
      this.fecha = DateTime.getNowFormatted()
      this.hora = "10:30 AM"
      this.flexible = true


    toString: ->
      "Viaje #{desde} - #{hacia}"

    @parseJSON: (jsonViaje) ->
      unViaje = new Viaje
      unViaje.desde = jsonViaje.ciudadOrigen.nombre
      unViaje.hacia = jsonViaje.ciudadDestino.nombre
      return unViaje