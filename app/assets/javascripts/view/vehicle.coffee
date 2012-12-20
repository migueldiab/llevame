root = exports ? this

class _VehicleView

  scope = null

  constructor: ->
    scope = angular.element(document).scope()

  load: =>
    scope.mainContent = 'partials/vehicle.html'
    scope.init = this.init

  init: =>
    console.log 'Loaded Vehicles'
    scope.nuevoVehiculo = this.nuevoVehiculo
    scope.cancel = this.cancelVehicle
    scope.save = this.saveVehicle
    VehicleCtrl.getInstance().getUserVehicles(VehicleView.getInstance().loadVehicles)

  saveVehicle: =>
    VehicleCtrl.getInstance().saveVehicle(VehicleView.getInstance().showVehicle)

  showVehicle: (data, status, headers, config) =>
    console.log "Showing Vehicle #{data} "
    if (201 == status)
      scope.vehiculo = Vehiculo.parseJSON(data)
    else
      View.getInstance().showError('Error Saving Vehicle', "Could not save. Status #{status}")

  cancelVehicle: =>
    VehicleCtrl.getInstance().getUserVehicles(VehicleView.getInstance().loadVehicles)

  loadVehicles: (data, status, headers, config) =>
    if (200 == status)
      if (data.length > 0)
        console.log "Loaded Vehicles : #{data.length}"
        VehicleCtrl.getInstance().loadVehicles(data)
        scope.initVehicle = ->
          scope.vehiculo = scope.vehiclesList[0]
        scope.vehicleContent = 'partials/newVehicle.html'
      else
        scope.initVehicle = ->
          console.log 'No Vehicle'
        scope.vehicleContent = 'partials/noVehicle.html'

  nuevoVehiculo: =>
    console.log 'Creando Vehiculo'
    scope.vehiculo = new Vehiculo()
    scope.vehicleContent = 'partials/newVehicle.html'
    scope.initVehicle = this.noVehicle

class root.VehicleView

  instance = undefined;

  @getInstance: ->
    instance ?= new _VehicleView


