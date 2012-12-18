define ['angular', 'common/MenuItem'
], (angular, MenuItem) ->

  root = exports ? this

  class _View

    scope = null

    constructor: ->
      console.log 'Init Main View'

    loadProfile: =>
      scope.mainContent = 'partials/profile.html'
      scope.init = ->
        console.log 'Loaded Profiles'

    loadRep: =>
      scope.mainContent = 'partials/rep.html'
      scope.init = ->
        console.log 'Loaded Rep'

    loadAboutUs: =>
      console.log 'About View'
      $('#formRegistrar').modal('show')
      $('#formRegistrar').load('/partials/aboutUs')
      return false

    loadNotifications: =>
      console.log 'Notifications View'
      $('#formRegistrar').modal('show')
      $('#formRegistrar').load('/partials/notificaciones')
      return false


    showError: (title, error) ->
      $('#errorMsg').slideDown(400)
      $('#errorMsgTitle').text title
      $('#errorMsgText').text error

    loadUserMenu: =>
      buscar = new MenuItem 'Buscar Viaje', 'SearchView.getInstance().load()'
      agregar = new MenuItem 'Nuevo Viaje', 'AddTripView.getInstance().load()'
      misViajes = new MenuItem 'Mis Viajes', 'MyTripsView.getInstance().load()'
      if (!scope)
        scope = angular.element(document).scope()
      scope.menuList = [buscar, agregar, misViajes]

#    userController: =>
#      console.log 'Loaded User Partial'
#      scope = angular.element(document).scope()
#      scope.agregarViaje = AddTripView.getInstance().loadNewTripView
#      $('#fechaSalida').datepicker()
#      scope.buscarViaje = ->
#        console.log 'Buscando Viaje'


  class root.View

    instance = undefined;

    @getInstance: ->
      instance ?= new _View


