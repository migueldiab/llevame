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
      return "Error: Email cannot be blank!"

    re = /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/
    if !re.test(email)
      return "Error: Invalid email format!"

    return true

  validatePassword: (password, repeat, email) ->

    if (password != "" && password == repeat) 
      if(password.length < 6) 
          error = "Error: Password must contain at least six characters!"
          return error
      
      if(password == email) 
          error = "Error: Password must be different from Username!"
          return error
      
      re = /[0-9]/
      if(!re.test(password)) 
          error = "Error: password must contain at least one number (0-9)!"
          return error
      
      re = /[a-z]/
      if(!re.test(password)) 
          error = "Error: password must contain at least one lowercase letter (a-z)!"
          return error
      
      re = /[A-Z]/
      if(!re.test(password)) 
          error = "Error: password must contain at least one uppercase letter (A-Z)!"
          return error
      
    else
      error = "Error: Please check that you've entered and confirmed your password!"
      return error

    return true

