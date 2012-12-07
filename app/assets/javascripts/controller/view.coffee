define [
  'angular'
  ,'view/navigationBar'
],
(
  angular
  ,NavBarView
) ->

  root = exports ? this

  class _View
    currentUser = null

    constructor: ->
      console.log 'Starting View Controller'

    loadPartials: (mainModule) ->
      console.log 'Loading Partials'
      module = angular.module('navigation-bar', [])
      module.directive('navigationBar', @navBar)
#      mainModule.requires.push('navigation-bar')
      angular.module('llevameApp', ['navigation-bar']);
      angular.bootstrap(document, ['llevameApp'])

    navBar: =>
      console.log 'Loading Navigation Bar'
      directiveDefinitionObject = {
        restrict: 'E'
        ,replace: false
        ,templateUrl: '/partials/navigationBar.html'
        ,link: NavBarView.getInstance().linkNavBar
      }
      return directiveDefinitionObject


  class root.View

    instance = undefined;

    @getInstance: ->
      instance ?= new _View


