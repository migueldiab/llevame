define [], () ->
  root = exports ? this

  class _User

    constructor: ->
      console.log 'Starting User Controller'

    loginUser: =>
      console.log 'Login User'
      jQuery.getJSON('login', null, @loadUser)
      return false;

    loginCurrentUser: ->
      console.log 'Trying to login user...'
      jQuery.getJSON('loginFromCookies', null, @loadUser)

    loadUser: (data, status, jqXHR) =>
      console.log 'Loading User via JSON'
      if ("success" == status && data)
        console.log 'Got JSON User : ' + data.login
        currentUser = data
        $('#frmLogin').slideToggle(300, @showUser)
      else
        console.log 'No user logged in'

    showUser: =>
      $('#userNav').fadeIn(300)

  class root.User

    instance = undefined;

    @getInstance: ->
      instance ?= new _User


