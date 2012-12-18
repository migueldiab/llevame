define ['controller/home'
  ,'controller/profileBar'
  ,'controller/trip'
  ,'controller/user'
  ,'controller/vehicle'
  ,'view/addTrip'
  ,'view/home'
  ,'view/myTrips'
  ,'view/navigationBar'
  ,'view/profileBar'
  ,'view/search'
  ,'view/vehicle'
  ,'view/view'
  ,'angular'
  ,'jquery'
  ,"jquery.lazyload.min"
  ,'common/validator'
], (HomeCtrl, ProfileBarCtrl, TripCtrl,UserCtrl,VehicleCtrl,
    AddTripView, HomeView, MyTripsView, NavBarView, ProfileBarView,
    SearchView, VehicleView, View,
    angular) ->

  class Llevame

    init: =>
      'use strict'
      this.initModules()
      this.initControllers()

    initModules: =>
      console.log('Starting App...')

      navBarMod = angular.module('navigation-bar', [])
      navBarMod.directive('navigationBar', @navBar)

      profileBarMod = angular.module('profile-bar', [])
      profileBarMod.directive('profileBar', @profileBar)

      llevameMod = angular.module('llevameApp', ['ui', 'navigation-bar', 'profile-bar'])

      llevameMod.run ($rootScope) ->
        $rootScope.author = 'Miguel A. Diab'

        $rootScope.executeMenu = (aMenuItem) ->
          console.log 'Menu : ' + aMenuItem.getAction()
          eval(aMenuItem.getAction())
        router = View.getInstance()
        $rootScope.profile = router.loadProfile
        $rootScope.notifications = router.loadNotifications
        $rootScope.aboutUs = router.loadAboutUs

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
#        ,controller: NavBarCtrl.getInstance
      }
      return directiveDefinitionObject

    profileBar: =>
      console.log 'Loading Profile Bar'
      directiveDefinitionObject = {
        restrict: 'E'
        ,replace: false
        ,templateUrl: '/partials/profileBar.html'
        ,link: ProfileBarView.getInstance().link
        ,controller: ProfileBarCtrl.getInstance
      }
      return directiveDefinitionObject
