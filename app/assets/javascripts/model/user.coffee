class @User
#  created_at
  dob = null
  email = null
#  id
  login = null
#  password
#  rep
#  salt
#  updated_at
#  verified

  constructor: (_login) ->
    console.log "Creating user #{_login}"
    login = _login

  getLogin: ->
    login

  setLogin: (val) ->
    login = val