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
    $http.post('viajes/proximos').success(@cargarProximosViajes).error(@cargarProximosViajes)

  loadUserTrips: =>
    console.log "Loading User Trips"
    $http.post('viajes/misProximos').success(@cargarMisViajes).error(@cargarMisViajes)
    $http.post('viajes/misRealizados').success(@cargarViajesRealizados).error(@cargarViajesRealizados)


  cargarProximosViajes: (data, status, headers, config) =>
    if (200 == status)
      scope.listaProximos = []
      console.log 'Viajes Cargados ' + data
      scope.listaProximos.push Viaje.parseJSON(item) for item in data
      console.log scope.listaViajes

    else if (409 == status)
      console.log 'Error al cargar viajes'
      View.getInstance().showError('Error al guardar Viaje', 'No se pudo guardar el viaje. Error : ' + data.error)

    else if (204 == status)
      console.log 'No hay viajes?'
      View.getInstance().showError('No se encontraron viajes!', 'Creá un viaje para compartir!')

    else
      console.log 'Respuesta Inesperada ' + status

      listaMisProximos

  cargarMisViajes: (data, status, headers, config) =>
    if (200 == status)
      scope.listaMisProximos = []
      console.log 'Viajes Cargados ' + data
      scope.listaMisProximos.push Viaje.parseJSON(item) for item in data
      console.log scope.listaRealizados

    else if (409 == status)
      console.log 'Error al cargar viajes realizados'
      View.getInstance().showError('Error al guardar Viaje', 'No se pudo guardar el viaje. Error : ' + data.error)

    else if (204 == status)
      console.log 'No hay viajes?'
      View.getInstance().showError('Todavía no has realizado ningún viaje!', 'Creá un viaje para compartir!')

    else
      console.log 'Respuesta Inesperada ' + status


  cargarViajesRealizados: (data, status, headers, config) =>
    if (200 == status)
      scope.listaRealizados = []
      console.log 'Viajes Cargados ' + data
      scope.listaRealizados.push Viaje.parseJSON(item) for item in data
      console.log scope.listaRealizados

    else if (409 == status)
      console.log 'Error al cargar viajes realizados'
      View.getInstance().showError('Error al guardar Viaje', 'No se pudo guardar el viaje. Error : ' + data.error)

    else if (204 == status)
      console.log 'No hay viajes?'
      View.getInstance().showError('Todavía no has realizado ningún viaje!', 'Creá un viaje para compartir!')

    else
      console.log 'Respuesta Inesperada ' + status



class root.TripCtrl

  instance = undefined;

  @getInstance: ->
    instance ?= new _TripCtrl


