root = exports ? this

class _SearchView
  scope = null

  constructor: ->
    console.log 'Loading Search View'
    scope = angular.element(document).scope()

  load: =>
    #      $('#mainContent').html '<h3>Loading Trips... pelase wait...</h3>'
    scope.mainContent = 'partials/search.html'
    scope.init = this.initSearch
    $('#frmLogin').slideUp(300, @showUser)

  initSearch: =>
    console.log 'Init Search'
    scope.detallesViaje = this.detallesViaje
    TripCtrl.getInstance().loadUpcomingTrips()

  detallesViaje: (unViaje) =>
    console.log "Detalles Viaje"
    scope.init = ->
      'Detalles Viaje ' + unViaje
    scope.viaje = unViaje
    scope.mainContent = 'partials/tripDetail.html'

  showUser: =>
    $('#userNav').fadeIn(300)



class root.SearchView

  instance = undefined;

  @getInstance: ->
    instance ?= new _SearchView

