define ['angular'
], (angular) ->

  root = exports ? this

  class _MyTripsView


    load: =>
      console.log 'Cargando Mis Viajes'
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/myTrips.html'
      scope.init = this.init

    init: =>
      console.log 'Inicializando Mis Viajes'
      $('#fechaSalida').datepicker()
      $('#horaSalida').timepicker({
        minuteStep: 15,
        showSeconds: false,
        showMeridian: true
      });
      injector = angular.element(document).injector()
      $http = injector.get('$http')

      $http.post('viajes/cargar', UserCtrl.getInstance().getCurrentUser()).success(@cargarViajes).error(@cargarViajes);

    cargarViajes: (data, status, headers, config) =>
      if (200 == status)
        console.log 'Viajes Cargados'
        console.log data

      else if (409 == status)
        console.log 'Error al cargar viajes'
        MainView.getInstance().showError('Error al guardar Viaje', 'No se pudo guardar el viaje. Error : ' + data.error)

      else
        console.log 'Respuesta Inesperada ' + status






  class root.MyTripsView

    instance = undefined;

    @getInstance: ->
      instance ?= new _MyTripsView


