define ['controller/home'
  ,'controller/view'
  ,'controller/user'
  ,'angular'
  ,'jquery'
  ,"jquery.lazyload.min"
  ,'common/validator'
], (HomeCtrl, ViewCtrl, UserCtrl, angular) ->

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

      angular.bootstrap document, ['llevameApp', 'navigation-bar']

    initControllers: =>

      homeController = HomeCtrl.getInstance()
      userController = UserCtrl.getInstance()

      homeController.startSlider()
      homeController.startLazyImages()
      homeController.startEventListeners()

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
