define ['controller/home'
  ,'controller/user'
  ,'controller/navigationBar'
  ,'view/home'
  ,'view/navigationBar'
  ,'view/agregar'
  ,'view/aboutUs'
  ,'view/notifications'
  ,'view/profile'
  ,'view/search'
  ,'view/myTrips'
  ,'view/main'
  ,'angular'
  ,'jquery'
  ,"jquery.lazyload.min"
  ,'common/validator'
], (HomeCtrl, UserCtrl, NavBarCtrl,
    HomeView, NavBarView, AgregarView, AboutUsView,
    NotificationsView, ProfileView, SearchView, MyTripsView,
    MainView,
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

      module = angular.module('navigation-bar', [])
      module.directive('navigationBar', @navBar)

      llevameMod = angular.module('llevameApp', ['navigation-bar'])
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
        ,link: NavBarView.getInstance().linkNavBar
        ,controller: NavBarCtrl.getInstance
      }
      return directiveDefinitionObject
