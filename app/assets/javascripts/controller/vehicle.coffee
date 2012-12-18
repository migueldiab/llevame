define [
  'angular', 'model/vehiculo'
], (angular, Vehiculo) ->

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
      params = [UserCtrl.getInstance().getCurrentUser()]
      $http.post('vehiculos/findAllForUser', params).success(@callback).error(@callback)

  class root.VehicleCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _VehicleCtrl


