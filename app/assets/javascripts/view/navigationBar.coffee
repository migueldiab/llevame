define [], () ->
  root = exports ? this

  class _NavBarView

    constructor: ->
      console.log 'Loading NavBar View Controller'


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

    linkNavBar: =>
      console.log 'Linking Nav Bar'
      this.addEventListeners()


    loginUser: =>
      console.log 'Clicked Btn Login'
      login = $('#login').val()
      password = $('#password').val()

      if (this.validateCredentials(login, password))
        console.log 'Validated Credentias'
        data =
          'login': login
          'password': password

        $.post('loginUser', data, UserCtrl.getInstance().loadUser, 'json')
        .error(UserCtrl.getInstance().loadUser)
      else
        console.log 'Invalid Credentias'
        ViewCtrl.getInstance().showError('Login Error', 'Invalid Username or Password')


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


