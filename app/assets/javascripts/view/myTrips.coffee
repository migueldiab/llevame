root = exports ? this

class _MyTripsView

  load: =>
    console.log 'Cargando Mis Viajes'
    scope = angular.element(document).scope()
    scope.mainContent = 'partials/myTrips.html'
    scope.init = this.init

  init: =>
    console.log 'Inicializando Mis Viajes'
#      $('#fechaSalida').datepicker()
#      $('#horaSalida').timepicker({
#        minuteStep: 15,
#        showSeconds: false,
#        showMeridian: true
#      });
    TripCtrl.getInstance().loadUserTrips()

class root.MyTripsView

  instance = undefined;

  @getInstance: ->
    instance ?= new _MyTripsView


