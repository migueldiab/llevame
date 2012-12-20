root = exports ? this

class _VehicleCtrl

  scope = null
  $http = null

  constructor: ->
    console.log 'Starting Vehicle Controller'
    scope = angular.element(document).scope()
    injector = angular.element(document).injector()
    $http = injector.get('$http')

  getUserVehicles: (callback) =>
    console.log('Getting User Vehicles')
    params = [UserCtrl.getInstance().getCurrentUser()]
    $http.post('vehiculos/findAllForUser', params).success(callback).error(callback)

  loadVehicles: (data) =>
    scope.vehiclesList = []
    scope.vehiclesList.push Vehiculo.parseJSON(item) for item in data
    scope.menuVehiculos = []
    for vehicle in scope.vehiclesList
      callback = "VehicleCtrl.getInstance().loadVehicle(#{vehicle.id})"
      menuItem = new MenuItem(vehicle.nombre, callback)
      scope.menuVehiculos.push menuItem

  loadVehicle: (id) =>
    console.log "Looking for #{id}"
    for vehicle in scope.vehiclesList
      if (vehicle.id == id)
        scope.vehiculo = vehicle

  saveVehicle: (callback) =>
    console.log 'Saving Vehicle'
    $http.post('vehiculos/new', scope.vehiculo).success(callback).error(callback)



class root.VehicleCtrl

  instance = undefined;

  @getInstance: ->
    instance ?= new _VehicleCtrl


