define ['angular', 'model/Viaje'
], (angular, Viaje) ->

  root = exports ? this

  class _AddTripView

    scope = null

    load: =>
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/addTrip.html'
      scope.init = this.initView
      scope.addTrip = this.addTrip
      scope.cancelar = SearchView.getInstance().load

    initView: =>
      console.log 'Nuevo Viaje'
      $('#fechaSalida').datepicker()
      $('#horaSalida').timepicker({
        minuteStep: 15,
        showSeconds: false,
        showMeridian: true
      })
      scope.viaje = new Viaje()
      console.log scope.viaje


    addTrip: =>
      console.log 'Agregando Viaje'
      if (this.validarFormulario())
        console.log 'Form Valido'
        console.log 'desde : ' + scope.viaje.desde
        console.log 'hacia : ' + scope.viaje.hacia
        console.log 'fecha : ' + scope.viaje.fecha
        console.log 'hora : ' + scope.viaje.hora
        console.log 'flexible : ' + scope.viaje.flexible
        injector = angular.element(document).injector()
        $http = injector.get('$http')

        $http.post('viajes/new', scope.viaje).success(@viajeAgregado).error(@viajeAgregado);

    viajeAgregado: (data, status, headers, config) =>
      if (201 == status)
        console.log 'Viaje Agregado'
        MyTripsView.getInstance().load()

      else if (409 == status)
        console.log 'Error al guardar viaje'
        MainView.getInstance().showError('Error al guardar Viaje', 'No se pudo guardar el viaje. Error : ' + data.error)



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


