define [
  'angular'
], (angular) ->

  root = exports ? this

  class _PerfilBarCtrl

    constructor: ->
      console.log 'Starting Perfil Bar'


  class root.PerfilBarCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _PerfilBarCtrl


