define ['angular', 'model/vehiculo', 'common/MenuItem'
], (angular, Vehiculo, MenuItem) ->

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
      scope.save= this.saveVehicle
      VehicleCtrl.getInstance().getUserVehicles(VehicleView.getInstance().loadVehicles)

    cancelVehicle: =>
      VehicleCtrl.getInstance().getUserVehicles(VehicleView.getInstance().loadVehicles)

    loadVehicles: (data, status, headers, config) =>
      if (200 == status)
        if (data.length > 0)
          console.log "Loaded Vehicles : #{data.length}"
          scope.vehiclesList = []
          scope.vehiclesList.push Vehiculo.parseJSON(item) for item in data
          VehicleView.getInstance().loadVehicleView()
        else
          scope.initVehicle = this.noVehicle
          scope.vehicleContent = 'partials/noVehicle.html'

    loadVehicleView: =>
      scope.initVehicle = this.menuLoad
      scope.vehicleContent = 'partials/newVehicle.html'

    menuLoad: =>
      console.log 'Loading Vehicles'
      scope.listaVehiculos = []
      for vehicle in scope.vehiclesList
        callback = "VehicleView.getInstance().loadVehicle(#{vehicle.id})"
        menuItem = new MenuItem(vehicle.nombre, callback)
        scope.listaVehiculos.push menuItem
      scope.vehiculo = scope.vehiclesList[0]


    loadVehicle: (id) =>
      console.log "Looking for #{id}"
      for vehicle in scope.vehiclesList
        if (vehicle.id == id)
          scope.vehiculo = vehicle



    noVehicle: =>
      console.log 'noVehicle'

    nuevoVehiculo: =>
      console.log 'Creando Vehiculo'
      scope.vehiculo = new Vehiculo()
      scope.vehicleContent = 'partials/newVehicle.html'
      scope.initVehicle = this.noVehicle

    saveVehicle: =>
      console.log 'Saving Vehicle'
      $http.post('vehiculos/new', scope.vehiculo).success(@showVehicle).error(@showVehicle)

    showVehicle: (data, status, headers, config) =>
      console.log "Showing Vehicle #{data} "
      this.requestVehicles()


  class root.VehicleView

    instance = undefined;

    @getInstance: ->
      instance ?= new _VehicleView


