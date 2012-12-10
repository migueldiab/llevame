define [], () ->
  class MenuItem

    name = null
    action = null

    constructor: (_name, _action) ->
      name = _name
      action = _action

    getName: ->
      return name

    getAction: ->
      return action
