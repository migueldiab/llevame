define [], () ->
  root = exports ? this

  class _NavBarView

    constructor: ->
      console.log 'Loading NavBar View Controller'


    addEventListeners: =>
      console.log 'Adding nav listener...'
      $('#btnLogin').click(this.loginUser)

    linkNavBar: =>
      console.log 'Linking Nav Bar'
      this.addEventListeners()


    loginUser: =>
      console.log 'Clicked Btn Login'
      login = $('#login').val()
      password = $('#password').val()
      data =
        'login': login
        'password': password

      $.post('loginUser', data, User.getInstance().loadUser, 'json')
      .error(User.getInstance().loadUser)
      return false


    showUser: =>
      $('#userNav').fadeIn(300)


  class root.NavBarView

    instance = undefined;

    @getInstance: ->
      instance ?= new _NavBarView


