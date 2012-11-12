define [], () ->
  class Home

    constructor: ->
      console.log 'Starting Home Controller'

    startSlider: ->
      console.log 'Starting Sliders'
      $('#button a').click ->

        integer = $(this).attr('rel')

        $('#myslide .cover').animate({left:-320*(parseInt(integer)-1)})  # Width of div mystuff (here 160)

        $('#button a').each ->

          $(this).removeClass('active')

          if $(this).hasClass('button'+integer)
            $(this).addClass('active')

          if $('img.lazy')[0].hidden
            $('img.lazy').each ->
              this.hidden = false
            $('img.lazy').lazyload
                  effect : "fadeIn"   


    startLazyImages: ->
      console.log 'Register lazy images'
      $('img.lazy').each ->
        this.hidden = true

    startEventListeners: ->
      console.log 'Buttons Event Listeners'
      # $('#btnRegister').click(showRegisterForm);
      $('#btnFormularioRegistro').click(@showRegisterForm)

    showRegisterForm: =>
      console.log 'Cargando Modal Registro'
      $('#formRegistrar').modal('show')
      $('#formRegistrar').load('registrar', null, @formLoaded)
      return false

    formLoaded: (response, status, xhr) =>
      console.log 'Form AJAX Cargado'
      if ("success" == status)
        $('#btnEnviarRegistro').click(@verificarPassword)
        $('#inputEmail').focus()        

    verificarPassword: ->
        console.log 'Verificando Password'
        email = $('#inputEmail').val()
        password = $('#inputPassword').val()
        password2 = $('#inputPasswordRepeat').val()

        if (!Validator.getInstance().validateEmail(email)) 
            console.log "Error: Invalid email!"
            return false
        
        if (password != "" && password == password2) 
            if(password.length < 6) 
                console.log "Error: Password must contain at least six characters!"
                $('#inputPassword').focus()
                return false
            
            if(password == email) 
                console.log "Error: Password must be different from Username!"
                $('#inputPassword').focus()
                return false
            
            re = /[0-9]/
            if(!re.test(password)) 
                console.log "Error: password must contain at least one number (0-9)!"
                $('#inputPassword').focus()
                return false
            
            re = /[a-z]/
            if(!re.test(password)) 
                console.log "Error: password must contain at least one lowercase letter (a-z)!"
                $('#inputPassword').focus()
                return false
            
            re = /[A-Z]/
            if(!re.test(password)) 
                console.log "Error: password must contain at least one uppercase letter (A-Z)!"
                $('#inputPassword').focus()
                return false
            
          else
            console.log "Error: Please check that you've entered and confirmed your password!"
            $('#inputPassword').focus()
            return false
        
        console.log "You entered a valid password: " + password
        return true
