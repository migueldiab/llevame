define ['controller/navigationBar'], (NavigationBarCtrl) ->
  root = exports ? this

  class _View
    currentUser = null

    constructor: ->
      console.log 'Starting View Controller'

    loadPartials: ->
      console.log 'Loading Partials'
      angular.module('navigation-bar', []).directive('navigationBar', @navBar)
      angular.module('llevameApp', ['navigation-bar']);

    navBar: =>
      console.log 'Loading Navigation Bar'
      directiveDefinitionObject = {
        restrict: 'E',
        replace: false,
        templateUrl: './partials/navigationBar.html',
        controller: NavigationBarCtrl
      }
      directiveDefinitionObject


  class root.View

    instance = undefined;

    @getInstance: ->
      instance ?= new _View


