define ['angular'
], (angular) ->

  root = exports ? this

  class _NotificationsView


    load: =>
      console.log 'About View'
      $('#formRegistrar').modal('show')
      $('#formRegistrar').load('/partials/notificaciones')
      return false


  class root.NotificationsView

    instance = undefined;

    @getInstance: ->
      instance ?= new _NotificationsView


