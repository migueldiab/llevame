define [], () ->
  class Home

    constructor: ->
      console.log 'Starting Home Controller'

    startSlider: ->
      console.log 'startSlider'
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
        $('#btnEnviarRegistro').click(@verificarFormulario)
        $('#inputEmail').focus()        

    verificarFormulario: ->
        console.log 'verificarFormulario'
        email = $('#inputEmail').val()
        password = $('#inputPassword').val()
        password2 = $('#inputPasswordRepeat').val()

        if (Validator.getInstance().validateEmail(email) != true) 
            console.log "Error: Invalid email! Adding error message"
            $('#ctrlGrpinputEmail').addClass('error')
            $('#helpInputEmail').text('Error!')
            
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
