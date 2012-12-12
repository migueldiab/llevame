define ['angular'
], (angular) ->

  root = exports ? this

  class _ProfileView


    load: =>
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/perfil.html'
      scope.init = this.init

    init: =>
      console.log 'Loaded Profiles'


  class root.ProfileView

    instance = undefined;

    @getInstance: ->
      instance ?= new _ProfileView


