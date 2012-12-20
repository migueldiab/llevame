root = exports ? this

class _UserCtrl

  $http = null
  scope = null

  constructor: ->
    console.log 'Starting User Controller'
    injector = angular.element(document).injector()
    $http = injector.get('$http')
    scope = angular.element(document).scope()


#    loginUser: =>
#      console.log 'Login User'
#      $http.post('login', null).success(@loadUser);
#      return false;

  loginCurrentUser: ->
    console.log 'Trying to login user...'
    $http.get('loginFromCookies', null).success(@loadUserOrDefaultHome);

  loadUserOrDefaultHome: (data, status, headers, config) =>
    console.log 'Loading User via JSON'
    if (200 == status && data != 'null')
      this.setCurrentUser(data)
    else if (200 == status)
      console.log 'Call OK but no user'
      HomeView.getInstance().load()
    else
      console.log 'Call Error\nStatus: ' + status + '\nResponse: ' + data
      View.getInstance().showError('Error de Login', 'Usuario o clave incorrectos. Olvidaste tu clave?')
      HomeView.getInstance().load()

  getCurrentUser: =>
    scope.user

  setCurrentUser: (user) =>
    console.log 'Setting Current User : ' + user.login
    scope.user = user
    View.getInstance().loadUserMenu()
    SearchView.getInstance().load()
#      NavBarCtrl.getInstance().setUser(self.currentUser)


class root.UserCtrl

  instance = undefined;

  @getInstance: ->
    instance ?= new _UserCtrl


