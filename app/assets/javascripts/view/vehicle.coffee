define ['angular', 'model/vehiculo', 'common/MenuItem'
], (angular, Vehiculo, MenuItem) ->

  root = exports ? this

  class _VehicleView

    scope = null
    $http = null

    load: =>
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/vehicle.html'
      scope.init = this.init

    init: =>
      console.log 'Loaded Vehicles'
      scope = angular.element($('#scopeVehicle')).scope()
      scope.nuevoVehiculo = this.nuevoVehiculo
      scope.cancel = this.requestVehicles
      scope.save= this.saveVehicle
      injector = angular.element(document).injector()
      $http = injector.get('$http')
      this.requestVehicles()

    requestVehicles: =>
      params = [UserCtrl.getInstance().getCurrentUser()]
      $http.post('vehiculos/findAll', params).success(@loadVehicles).error(@loadVehicles)

    loadVehicles: (data, status, headers, config) =>
      if (200 == status)
        if (data.length > 0)
          console.log "Loaded Vehicles : #{data.length}"
          scope.vehiclesList = []
          scope.vehiclesList.push Vehiculo.parseJSON(item) for item in data
          scope.initVehicle = this.menuLoad
          scope.vehicleContent = 'partials/newVehicle.html'
        else
          scope.initVehicle = this.noVehicle
          scope.vehicleContent = 'partials/noVehicle.html'

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


