root = exports ? this

class root.Validator

  instance = undefined;

  @getInstance: ->
    instance ?= new _Validator

class _Validator
  
  constructor: ->
    console.log "Constructing Validator"

  validateEmail: (email) ->

    if email == ""
      console.log "Error: Email cannot be blank!"
      $('#inputEmail').focus()
      return "Error: Email cannot be blank!"

    re = /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/
    if !re.test(email)
      console.log "Error: Invalid email!"
      $('#inputEmail').focus()
      return "Error: Invalid email!"

    return true

