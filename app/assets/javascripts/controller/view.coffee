define ['angular', 'controller/home'  ,'common/MenuItem'
], (angular, HomeCtrl, MenuItem) ->

  root = exports ? this

  class _ViewCtrl
    scope = null

    constructor: ->
      console.log 'Starting View Controller'

    showError: (title, error) ->
      $('#errorMsg').slideDown(400)
      $('#errorMsgTitle').text title
      $('#errorMsgText').text error


    loadAboutView: =>
      console.log 'About View'
      $('#formRegistrar').modal('show')
      $('#formRegistrar').load('/partials/acercaDe')
      return false

    loadHomeView: =>
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/home.html'
      scope.init = this.homeController

    homeController: =>
      homeController = HomeCtrl.getInstance()

      homeController.startSlider()
      homeController.startLazyImages()
      homeController.startEventListeners()



    loadUserMenu: =>
      scope = angular.element(document).scope()
      #
      buscar = new MenuItem 'Buscar Viaje', 'ViewCtrl.getInstance().loadUserView()'
      agregar = new MenuItem 'Agregar', 'ViewCtrl.getInstance().loadNewTripView()'
      notif = new MenuItem 'Notificaciones', 'ViewCtrl.getInstance().loadNotificationsView()'
      acercaDe = new MenuItem 'Acerca de', 'ViewCtrl.getInstance().loadAboutView()'
      scope.menuList = [buscar, agregar, notif, acercaDe]

    loadNotificationsView: =>
      console.log 'About View'
      $('#formRegistrar').modal('show')
      $('#formRegistrar').load('/partials/notificaciones')
      return false

    loadProfileView: =>
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/perfil.html'
      scope.init = ->

    loadUserView: =>
#      $('#mainContent').html '<h3>Loading Trips... pelase wait...</h3>'
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/user.html'
      scope.init = this.userController
      $('#frmLogin').slideUp(300, @showUser)

    showUser: =>
      $('#userNav').fadeIn(300)

    userController: =>
        console.log 'Loaded User Partial'
        scope = angular.element(document).scope()
        scope.agregarViaje = this.loadNewTripView

        scope.buscarViaje = ->
          console.log 'Buscando Viaje'

    loadNewTripView: =>
        console.log 'Agregando Viaje'
        scope = angular.element(document).scope()
        scope.mainContent = 'partials/agregar.html'
        scope.init = ->
          console.log 'Nuevo Viaje'
          $('#dp3').datepicker()


  class root.ViewCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _ViewCtrl


