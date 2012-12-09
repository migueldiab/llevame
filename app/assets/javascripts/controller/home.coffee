define ['angular'], (angular) ->

  root = exports ? this

  class _Home

    constructor: ->
      console.log 'Starting Home Controller'

    startSlider: ->
      console.log 'startSlider'
      $('#button a').click ->
        integer = $(this).attr('rel')
        $('#myslide .cover').animate({left:-320*(parseInt(integer)-1)})  # Width of div mystuff (here 160)
        $('#button a').each ->
          $(this).removeClass('lazy-active')
          if $(this).hasClass('button'+integer)
            $(this).addClass('lazy-active')
          $('img.lazy').each ->
            if this.hidden
              this.hidden = false
          $('img.lazy').lazyload
            effect : "fadeIn"


    startLazyImages: ->
      console.log 'startLazyImages'
      $('img.lazy').each ->
        this.hidden = true

    startEventListeners: ->
      console.log 'startEventListeners'
      # $('#btnRegister').click(showRegisterForm);
      $('#btnFormularioRegistro').click(@showRegisterForm)
      return true

    showRegisterForm: =>
      console.log 'showRegisterForm'
      $('#formRegistrar').modal('show')
      $('#formRegistrar').load('registrar', null, @formLoaded)
      return false

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
        ViewCtrl.getInstance().showError('Register Error ' + status, data.error)

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

  class root.Home

    instance = undefined;

    @getInstance: ->
      instance ?= new _Home


