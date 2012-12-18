define ['angular', 'model/viaje'],
(angular, Viaje) ->
  root = exports ? this

  class _TripCtrl

    scope = null
    $http = null

    constructor: ->
      console.log 'Starting Trips Controller'
      scope = angular.element(document).scope()
      injector = angular.element(document).injector()
      $http = injector.get('$http')

    newTrip: =>
      scope.viaje = new Viaje()
      console.log scope.viaje

    addTrip: =>
      $http.post('viajes/new', scope.viaje).success(@viajeAgregado).error(@viajeAgregado);

    viajeAgregado: (data, status, headers, config) =>
      if (201 == status)
        console.log 'Viaje Agregado'
        MyTripsView.getInstance().load()

      else if (409 == status)
        console.log 'Error al guardar viaje'
        View.getInstance().showError('Error al guardar Viaje', 'No se pudo guardar el viaje. Error : ' + data.error)



    loadUpcomingTrips: =>
      console.log "Loading Upcoming Trips"
      $http.post('viajes/cargar', UserCtrl.getInstance().getCurrentUser()).success(@cargarViajes).error(@cargarViajes)

    loadUserTrips: =>
      console.log "Loading User Trips"
      $http.post('viajes/cargar', UserCtrl.getInstance().getCurrentUser()).success(@cargarViajes).error(@cargarViajes)


    cargarViajes: (data, status, headers, config) =>
      if (200 == status)
        scope.listaViajes = []
        console.log 'Viajes Cargados ' + data
        scope.listaViajes.push Viaje.parseJSON(item) for item in data
        console.log scope.listaViajes

      else if (409 == status)
        console.log 'Error al cargar viajes'
        View.getInstance().showError('Error al guardar Viaje', 'No se pudo guardar el viaje. Error : ' + data.error)

      else if (204 == status)
        console.log 'No hay viajes?'
        View.getInstance().showError('No se encontraron viajes!', 'Posible error en base de datos')

      else
        console.log 'Respuesta Inesperada ' + status



  class root.TripCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _TripCtrl


