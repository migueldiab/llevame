root = exports ? this

class _HomeView

  constructor: ->
    console.log 'Starting Home View'


  load: =>
    scope = angular.element(document).scope()
    scope.mainContent = 'partials/home.html'
    scope.init = this.homeController

  homeController: =>
    this.startSlider()
    this.startLazyImages()
    this.startEventListeners()

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
    $('#formRegistrar').load('registrar', null, HomeCtrl.getInstance().formLoaded)
    return false

class root.HomeView

  instance = undefined;

  @getInstance: ->
    instance ?= new _HomeView


