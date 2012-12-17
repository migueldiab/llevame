define ['angular'], (angular) ->
  root = exports ? this

  class _TripCtrl



    constructor: ->
      console.log 'Starting Trips Controller'


  class root.TripCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _TripCtrl


