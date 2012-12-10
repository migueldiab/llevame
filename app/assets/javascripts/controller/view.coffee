define ['angular', 'controller/home'], (angular, HomeCtrl) ->

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
        scope.agregarViaje = ->
          console.log 'Agregando Viaje'
          scope = angular.element(document).scope()
          scope.mainContent = 'partials/agregar.html'
          scope.init = ->
            console.log 'Nuevo Viaje'

        scope.buscarViaje = ->
          console.log 'Buscando Viaje'

  class root.ViewCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _ViewCtrl


