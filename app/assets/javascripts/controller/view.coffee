define [], () ->
  class View

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
        $('#frmLogin').slideToggle(600, @showUser)
      else
        console.log 'No user logged in'

    showUser: =>
      userMenu = $('<ul/>').addClass('nav')
      profileLi = $('<li/>').append(
        $('<a/>').attr('href', 'profile').html(currentUser.login)
      )
      userMenu.append(profileLi)
      logOutLi = $('<li/>').append(
        $('<a/>').attr('href', 'signout').html('Log Out')
      )
      userMenu.append(logOutLi)
      $('#divCurrentUser').append(userMenu)

