root = exports ? this # http://stackoverflow.com/questions/4214731/coffeescript-global-variables

# The publicly accessible Singleton fetcher
class root.Singleton
  _instance = undefined # Must be declared here to force the closure on the class
  @get: (args) -> # Must be a static method
    _instance ?= new _Singleton args

# The actual Singleton class
class _Singleton
  constructor: (@args) ->

  echo: ->
    @args
