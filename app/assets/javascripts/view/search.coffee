define [], () ->
  root = exports ? this

  class _SearchView

    constructor: ->
      console.log 'Loading Search View'

    load: =>
      #      $('#mainContent').html '<h3>Loading Trips... pelase wait...</h3>'
      scope = angular.element(document).scope()
      scope.mainContent = 'partials/search.html'
      scope.init = this.userController
      $('#frmLogin').slideUp(300, @showUser)

    showUser: =>
      $('#userNav').fadeIn(300)



  class root.SearchView

    instance = undefined;

    @getInstance: ->
      instance ?= new _SearchView

