define [
  'model/User'
  ,'angular'
], (User, angular) ->

  root = exports ? this

  class _NavBarCtrl

    constructor: ->
      console.log 'Starting View Controller'

    setUser: (_user) ->
      scope = angular.element(document).scope()
      scope.user = _user
#      scope.$apply();

    getUser: ->
      scope = angular.element(document).scope()
      scope.user


  class root.NavBarCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _NavBarCtrl


