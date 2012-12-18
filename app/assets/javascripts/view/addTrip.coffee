define ['angular', 'model/viaje'
], (angular, Viaje) ->

  root = exports ? this

  class _AddTripView

    scope = null

    constructor: ->
      scope = angular.element(document).scope()

    load: =>
      scope.mainContent = 'partials/addTrip.html'
      scope.init = this.initView
      scope.addTrip = this.addTrip
      scope.cancelar = SearchView.getInstance().load

    initView: =>
      console.log 'Nuevo Viaje'
#      scope = angular.element($('#scopeAgregar')).scope()
      VehicleCtrl.getInstance().getUserVehicles(AddTripView.getInstance().processVehicles())
      $('#fechaSalida').datepicker()
      $('#horaSalida').timepicker({
        minuteStep: 15,
        showSeconds: false,
        showMeridian: true
      })

    processVehicles: =>
      console.log 'Processing Vehicles'
      TripCtrl.getInstance().newTrip()


    addTrip: =>
      console.log 'Agregando Viaje'
      if (this.validarFormulario())
        console.log 'Form Valido'
        TripCtrl.getInstance().addTrip()

    validarFormulario: =>
      console.log 'Validando Formulario'
      return true

#    controller = ->
#      ng-controller="AddTripView.getInstance().controller()"
#      console.log 'Agregar Controller'


  class root.AddTripView

    instance = undefined;

    @getInstance: ->
      instance ?= new _AddTripView


