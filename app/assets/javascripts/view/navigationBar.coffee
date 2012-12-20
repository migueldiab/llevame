root = exports ? this

class _NavBarView

  constructor: ->
    console.log 'Loading NavBar View'


  addEventListeners: =>
    console.log 'Adding nav listener...'
    $('#btnLogin').click(this.loginUser)
    $('#btnToggleNavBar').click(this.collapseNavBar)
    $('#btnCloseError').click(this.closeErrorModal)

  closeErrorModal: =>
    $('#errorMsg').slideUp(400)


  collapseNavBar: =>
    console.log 'Toggling Nav Bar'
    $('#mainNavBar').collapse('toggle')

  link: ($scope) =>
    console.log 'Linking Nav Bar'
    this.addEventListeners()
    this.configureMenuItems($scope)

  configureMenuItems: ($scope) =>
    item = new MenuItem('Acerca de', 'View.getInstance().loadAboutUs()')
    $scope.menuList = [item]

  loginUser: =>
    console.log 'Clicked Btn Login'
    login = $('#login').val()
    password = $('#password').val()

    if (this.validateCredentials(login, password))
      console.log 'Validated Credentias'
      params =
        'login': login
        'password': password

#        $.post('loginUser', params, UserCtrl.getInstance().loadUser, 'json')
#        .error(UserCtrl.getInstance().loadUser)
      injector = angular.element(document).injector()
      $http = injector.get('$http')
      $http.post('loginUser', params).success(UserCtrl.getInstance().loadUserOrDefaultHome)
        .error(UserCtrl.getInstance().loadUserOrDefaultHome);

    else
      console.log 'Invalid Credentias'
      View.getInstance().showError('Login Error', 'Invalid Username or Password')


    return false

  validateCredentials: (login, password) ->

    if (!login)
      return false

    if (!password)
      return false

    if login == password
      return false

    if (login.length < 3)
      return false

    if (password.length < 3)
      return false

    return true

class root.NavBarView

  instance = undefined;

  @getInstance: ->
    instance ?= new _NavBarView


