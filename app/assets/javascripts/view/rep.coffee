define ['angular'
], (angular) ->

  root = exports ? this

  class _RepView


    load: =>
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/Rep.html'
      scope.init = this.init

    init: =>
      console.log 'Loaded Rep'


  class root.RepView

    instance = undefined;

    @getInstance: ->
      instance ?= new _RepView


