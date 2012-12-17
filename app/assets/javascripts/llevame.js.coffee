define ['controller/home'
  ,'controller/user'
  ,'controller/navigationBar'
  ,'controller/perfilBar'
  ,'controller/trip'
  ,'view/navigationBar'
  ,'view/perfilBar'
  ,'view/home'
  ,'view/addTrip'
  ,'view/aboutUs'
  ,'view/notifications'
  ,'view/profile'
  ,'view/search'
  ,'view/myTrips'
  ,'view/main'
  ,'view/vehicle'
  ,'view/rep'
  ,'angular'
  ,'jquery'
  ,"jquery.lazyload.min"
  ,'common/validator'
], (HomeCtrl, UserCtrl, NavBarCtrl, PerfilBarCtrl, TripCtrl
    NavBarView, PerfilBarView,
    HomeView, AddTripView, AboutUsView,
    NotificationsView, ProfileView, SearchView, MyTripsView,
    MainView, VehicleView, RepView
    angular) ->

  class Llevame
    init: =>
      'use strict'
      this.initModules()
      this.initControllers()

    initModules: =>
      console.log('Starting App...')
#      ViewCtrl.getInstance()
#      UserCtrl.getInstance()
#      HomeCtrl.getInstance()

      navBarMod = angular.module('navigation-bar', [])
      navBarMod.directive('navigationBar', @navBar)

      perfilBarMod = angular.module('perfil-bar', [])
      perfilBarMod.directive('perfilBar', @perfilBar)

      llevameMod = angular.module('llevameApp', ['navigation-bar', 'perfil-bar'])
      llevameMod.run ($rootScope) ->
        $rootScope.author = 'Miguel A. Diab'

        $rootScope.executeMenu = (aMenuItem) ->
          console.log 'Menu : ' + aMenuItem.getAction()
          eval(aMenuItem.getAction())
        $rootScope.profile = ProfileView.getInstance().load
        $rootScope.notifications = NotificationsView.getInstance().load
        $rootScope.aboutUs = AboutUsView.getInstance().load
#        $rootScope.mainContent = 'partials/home.html'
#        $rootScope.init = this.initControllers


      angular.bootstrap document, ['llevameApp', 'navigation-bar']

    initControllers: =>
      console.log 'Init Llevame Controllers'
      UserCtrl.getInstance().loginCurrentUser()

    navBar: =>
      console.log 'Loading Navigation Bar'
      directiveDefinitionObject = {
        restrict: 'E'
        ,replace: false
        ,templateUrl: '/partials/navigationBar.html'
        ,link: NavBarView.getInstance().link
        ,controller: NavBarCtrl.getInstance
      }
      return directiveDefinitionObject

    perfilBar: =>
      console.log 'Loading Perfil Bar'
      directiveDefinitionObject = {
        restrict: 'E'
        ,replace: false
        ,templateUrl: '/partials/perfilBar.html'
        ,link: PerfilBarView.getInstance().link
        ,controller: PerfilBarCtrl.getInstance
      }
      return directiveDefinitionObject
