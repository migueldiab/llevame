define ['angular'
], (angular) ->

  root = exports ? this

  class _VehicleView


    load: =>
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/vehicle.html'
      scope.init = this.init

    init: =>
      console.log 'Loaded Vehicles'


  class root.VehicleView

    instance = undefined;

    @getInstance: ->
      instance ?= new _VehicleView


