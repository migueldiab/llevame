class @Vehiculo

  id: null
  nombre: ""
  puertas: null
  color: null
  modelo: null
  marca: null
  maxPasajeros: null
  seguro: null
  auxilio: null

  constructor: ->

  getNombre: =>
    if (this.nombre == "")
      return "Nuevo Vehiculo"
    else
      return this.nombre


  @parseJSON: (jsonVehiculo) ->
    unVehiculo = new Vehiculo()
    unVehiculo.id = jsonVehiculo.id
    unVehiculo.nombre = jsonVehiculo.nombre
    unVehiculo.puertas = jsonVehiculo.puertas
    unVehiculo.color = jsonVehiculo.color
    if (jsonVehiculo.modelo)
      unVehiculo.modelo = jsonVehiculo.modelo.nombre
#      unVehiculo.marca = jsonVehiculo.modelo.fabricante.nombre
    unVehiculo.maxPasajeros = jsonVehiculo.maxPasajeros
    if (jsonVehiculo.seguro)
      unVehiculo.seguro = jsonVehiculo.seguro.nombre
    if (jsonVehiculo.auxilio)
      unVehiculo.auxilio = jsonVehiculo.auxilio.nombre
    return unVehiculo