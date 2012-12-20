root = exports ? this

class _ProfileBarCtrl

  constructor: ->
    console.log 'Starting Profile Bar'


class root.ProfileBarCtrl

  instance = undefined;

  @getInstance: ->
    instance ?= new _ProfileBarCtrl


