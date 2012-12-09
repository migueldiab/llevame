define [], () ->
  root = exports ? this

  class _UserView

    scope = null

    constructor: ->
      console.log 'Loading User View Controller'



  class root.UserView

    instance = undefined;

    @getInstance: ->
      instance ?= new _UserView


