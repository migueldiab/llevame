define ['angular', 'controller/home'  ,'common/MenuItem'
], (angular, HomeCtrl, MenuItem) ->

  root = exports ? this

  class _AgregarView

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

    agregarViaje: =>
      console.log 'Agregando Viaje'
      scope = angular.element($('#scopeAgregar')).scope()
      if (this.validarFormulario())
        console.log 'Form Valido'
        console.log 'Salida : ' + scope.viaje.salida
        console.log 'Form : ' + scope.frmViaje.desde

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


