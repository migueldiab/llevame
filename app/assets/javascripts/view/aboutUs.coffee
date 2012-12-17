define ['angular'
], (angular) ->

  root = exports ? this

  class _AboutUsView

    load: =>
      console.log 'About View'
      $('#formRegistrar').modal('show')
      $('#formRegistrar').load('/partials/aboutUs')
      return false


  class root.AboutUsView

    instance = undefined;

    @getInstance: ->
      instance ?= new _AboutUsView


