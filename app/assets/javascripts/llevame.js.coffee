define ['controller/home'
  ,'controller/view'
  ,'controller/user'
  ,'controller/llevame'
  ,'angular'
  ,'jquery'
  ,"jquery.lazyload.min"
  ,'common/validator'
], (HomeCtrl, ViewCtrl, UserCtrl, llevameCtrl, angular) ->

  class Llevame
    init: =>
      'use strict'
      this.initModules()
      this.initControllers()

    initModules: =>
      module = angular.module('navigation-bar', [])
      module.directive('navigationBar', @navBar)

      llevameMod = angular.module('llevameApp', ['navigation-bar'])
      llevameMod.run ($rootScope) ->
        console.log('Starting App...')
        $rootScope.author = 'Miguel A. Diab'
#        $rootScope.mainContent = 'partials/home.html'
#        $rootScope.init = this.initControllers


      angular.bootstrap document, ['llevameApp', 'navigation-bar']

    initControllers: =>
      console.log 'Init Llevame Controllers'
      userController = UserCtrl.getInstance()
      userController.loginCurrentUser()

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
