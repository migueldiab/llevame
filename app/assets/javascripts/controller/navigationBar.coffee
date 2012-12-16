define [
  'model/user'
  ,'angular'
], (User, angular) ->

  root = exports ? this

  class _NavBarCtrl

    constructor: ->
      console.log 'Starting Nav Bar'

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


