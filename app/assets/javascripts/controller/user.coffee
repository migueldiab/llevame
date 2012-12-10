define ['angular'], (angular) ->
  root = exports ? this

  class _UserCtrl

    currentUser: null

    constructor: ->
      console.log 'Starting User Controller'

    loginUser: =>
      console.log 'Login User'
#      injector = angular.element(document).injector()
#      $http = injector.get('$http')
      $http.post('login', null).success(@loadUser);
#      jQuery.getJSON('login', null, @loadUser)
      return false;

    loginCurrentUser: ->
      console.log 'Trying to login user...'
#      jQuery.getJSON('loginFromCookies', null, @loadUser)
      injector = angular.element(document).injector()
      $http = injector.get('$http')
      $http.get('loginFromCookies', null).success(@loadUserOrDefaultHome);

    loadUserOrDefaultHome: (data, status, headers, config) =>
      if (!this.loadUser(data, status, headers, config))
        ViewCtrl.getInstance().loadHomeView()

    loadUser: (data, status, headers, config) =>
      console.log 'Loading User via JSON'
      result = false
      if (200 == status && data != 'null')
        this.setCurrentUser(data)
        result = true
      else if (200 == status)
        console.log 'Call OK but no user'
      else
        console.log 'Call Error\nStatus: ' + status + '\nResponse: ' + headers + ' - '+ config
        ViewCtrl.getInstance().showError('Error de Login', 'Usuario o clave incorrectos. Olvidaste tu clave?')
      result

    getCurrentUser: =>
      self.currentuser

    setCurrentUser: (user) =>
      console.log 'Setting Current User : ' + user.login
      self.currentUser = user
      ViewCtrl.getInstance().loadUserView()
      NavBarCtrl.getInstance().setUser(self.currentUser)

  class root.UserCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _UserCtrl


