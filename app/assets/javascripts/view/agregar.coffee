define ['angular', 'common/DateTime'
], (angular, DateTime) ->

  root = exports ? this

  class _AgregarView

    scope = null

    load: =>
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/agregar.html'
      scope.init = this.initView
      scope.agregarViaje = this.agregarViaje
      scope.cancelar = SearchView.getInstance().load

    initView: =>
      console.log 'Nuevo Viaje'
      $('#fechaSalida').datepicker()
      $('#horaSalida').timepicker({
        minuteStep: 15,
        showSeconds: false,
        showMeridian: true
      })
      scope.viaje = []
      scope.viaje.desde = "Montevideo"
      scope.viaje.hacia = "Punta del Este"
      scope.viaje.fecha = DateTime.getNowFormatted()
      scope.viaje.hora = "10:30 AM"
      scope.viaje.flexible = true


    agregarViaje: =>
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
      console.log 'Viaje Agregado'
      console.log status

    validarFormulario: =>
      console.log 'Validando Formulario'
      return true

#    controller = ->
#      ng-controller="AgregarView.getInstance().controller()"
#      console.log 'Agregar Controller'


  class root.AgregarView

    instance = undefined;

    @getInstance: ->
      instance ?= new _AgregarView


