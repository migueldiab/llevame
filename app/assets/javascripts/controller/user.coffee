define [], () ->
  root = exports ? this

  class _UserCtrl

    currentUser: null

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
        self.currentUser = data
        ViewCtrl.getInstance().loadUserView()
        NavBarCtrl.getInstance().setUser(self.currentUser)

      else
        console.log 'No User Loaded \nStatus: ' + status + '\nResponse: ' + jqXHR.statusText + ' - '+ jqXHR.responseText

    getCurrentUser: ->
      self.currentuser

  class root.UserCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _UserCtrl


