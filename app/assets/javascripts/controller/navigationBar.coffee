define ['model/User'], (User) ->

  root = exports ? this

  class _NavBarCtrl

    scope = null

    constructor: ->
      console.log 'Starting View Controller'

    init: ($scope) ->
      console.log 'Setting Var'
      scope = $scope

    setUser: (_user) ->
      scope.user = _user
      scope.$apply();

    getScope: ->
      scope

    getUser: ->
      scope.user


  class root.NavBarCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _NavBarCtrl


