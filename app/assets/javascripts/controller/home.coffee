define [], () ->

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

          if $('img.lazy')[0].hidden
            $('img.lazy').each ->
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
        $('#mainContent').load('newUser', params, @llevameLoaded)
        return false

    llevameLoaded: (response, status, xhr) =>
      console.log 'llevameLoaded AJAX'
      if ("success" == status)
        $('#frmLogin').fadeOut(1000);

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


