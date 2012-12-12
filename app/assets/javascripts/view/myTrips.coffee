define ['angular'
], (angular) ->

  root = exports ? this

  class _MyTripsView


    load: =>
      console.log 'Cargando Mis Viajes'
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/misViajes.html'
      scope.init = this.init

    init: ->
      console.log 'Nuevo Viaje'
      $('#fechaSalida').datepicker()
      $('#horaSalida').timepicker({
        minuteStep: 15,
        showSeconds: false,
        showMeridian: true
      });


  class root.MyTripsView

    instance = undefined;

    @getInstance: ->
      instance ?= new _MyTripsView


