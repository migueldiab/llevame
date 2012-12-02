define [], () ->
  root = exports ? this

  class _View
    currentUser = null

    constructor: ->
      console.log 'Starting View Controller'

    loadPartials: ->
      console.log 'Loading Partials'
      angular.module('navigation-bar', []).directive('navigationBar', @navBar)
      angular.module('llevameApp', ['navigation-bar']);

    navBar: =>
      console.log 'Loading Navigation Bar'
      directiveDefinitionObject = {
        restrict: 'E',
        replace: false,
        templateUrl: './partials/navigationBar.html'
      }
      directiveDefinitionObject

    loginCurrentUser: ->
      console.log 'Trying to login user...'
      jQuery.getJSON('login', null, @loadUser)

    loadUser: (data, status, jqXHR) =>
      if ("success" == status && data)
        console.log 'Got JSON User : ' + data.login
        currentUser = data
        $('#frmLogin').slideToggle(300, @showUser)
      else
        console.log 'No user logged in'

    showUser: =>
      $('#userNav').fadeIn(300)


  class root.View

    instance = undefined;

    @getInstance: ->
      instance ?= new _View


