define ['angular', 'controller/home'  ,'common/MenuItem'
], (angular, HomeCtrl, MenuItem) ->

  root = exports ? this

  class _MainView
    scope = null

    constructor: ->
      console.log 'Starting View Controller'

    showError: (title, error) ->
      $('#errorMsg').slideDown(400)
      $('#errorMsgTitle').text title
      $('#errorMsgText').text error

    loadUserMenu: =>
      scope = angular.element(document).scope()
      #
      buscar = new MenuItem 'Buscar Viaje', 'SearchView.getInstance().load()'
      agregar = new MenuItem 'Agregar', 'AgregarView.getInstance().load()'
      misViajes = new MenuItem 'Mis Viajes', 'MyTripsView.getInstance().load()'
      scope.menuList = [buscar, agregar, misViajes]

    userController: =>
        console.log 'Loaded User Partial'
        scope = angular.element(document).scope()
        scope.agregarViaje = AgregarView.getInstance().loadNewTripView
        $('#fechaSalida').datepicker()
        scope.buscarViaje = ->
          console.log 'Buscando Viaje'


  class root.MainView

    instance = undefined;

    @getInstance: ->
      instance ?= new _MainView


