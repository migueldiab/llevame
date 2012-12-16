define ['angular', 'model/vehiculo'
], (angular, Vehiculo) ->

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
      injector = angular.element(document).injector()
      $http = injector.get('$http')
      this.loadDefault()

    loadDefault: ->
      scope.vehicleContent = 'partials/noVehicle.html'
      scope.initVehicle = this.noVehicle

    noVehicle: =>
      console.log 'noVehicle'

    nuevoVehiculo: =>
      console.log 'Creando Vehiculo'
      scope.vehicleContent = 'partials/newVehicle.html'
      scope.initVehicle = this.newVehicle

    newVehicle: =>
      console.log 'Init New Vehiculo'
      scope.cancel = this.loadDefault
      scope.save= this.saveVehicle
      scope.vehiculo = new Vehiculo()

    saveVehicle: =>
      console.log 'Saving Vehicle'
      $http.post('vehiculos/new', scope.vehiculo).success(@showVehicle).error(@showVehicle)

    showVehicle: =>
      console.log 'Showing Vehicle'


  class root.VehicleView

    instance = undefined;

    @getInstance: ->
      instance ?= new _VehicleView


