root = exports ? this

class _HomeCtrl

  constructor: ->
    console.log 'Starting Home Controller'

  formLoaded: (response, status, xhr) =>
    console.log 'formLoaded AJAX'
    if ("success" == status)
      $('#btnEnviarRegistro').click(@procesarFormulario)
      $('#inputEmail').focus()        

  procesarFormulario: =>
    if (@verificarFormulario()) 
      console.log 'Loading Llevame'
      $('#formRegistrar').modal('hide')
      params = { inputEmail: $('#inputEmail').val()
        , inputPassword: $('#inputPassword').val()
        , inputPasswordRepeat: $('#inputPasswordRepeat').val() }
#        jQuery.getJSON('newUser', params, @llevameLoaded)
      injector = angular.element(document).injector()
      $http = injector.get('$http')
      $http.post('newUser', params).success(@llevameLoaded).error(@llevameLoaded);
      return false

  llevameLoaded: (data, status, headers, config) =>
    console.log 'llevame Loaded AJAX ' + data
    if (200 == status && data != undefined)

      UserCtrl.getInstance().setCurrentUser(data)
    else
      View.getInstance().showError('Register Error ' + status, data.error)

  verificarFormulario: ->
      console.log 'verificarFormulario'
      email = $('#inputEmail').val()
      password = $('#inputPassword').val()
      password2 = $('#inputPasswordRepeat').val()

      $('#ctrlGrpInputEmail').removeClass('error')
      $('#helpInputEmail').text("")

      $('#ctrlGrpInputPassword').removeClass('error')
      $('#helpInputPassword').text("")


      validateEmailResponse = Validator.getInstance().validateEmail(email)
      if (validateEmailResponse != true) 
        console.log validateEmailResponse
        $('#ctrlGrpInputEmail').addClass('error')
        $('#helpInputEmail').text(validateEmailResponse)            
        $('#inputEmail').focus()
        return false

      $('#ctrlGrpInputEmail').addClass('success')

      validatePasswordResponse = Validator.getInstance().validatePassword(password, password2, email)
      if (validatePasswordResponse != true) 
        console.log validatePasswordResponse
        $('#ctrlGrpInputPassword').addClass('error')
        $('#helpInputPassword').text(validatePasswordResponse)            
        $('#inputPassword').focus()
        return false

      $('#ctrlGrpInputPassword').addClass('success')

      
      console.log "You entered a valid password: " + password
      return true

class root.HomeCtrl

  instance = undefined;

  @getInstance: ->
    instance ?= new _HomeCtrl


