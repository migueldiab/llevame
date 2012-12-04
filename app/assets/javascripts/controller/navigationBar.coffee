define ['controller/navigationBar'], (NavigationBarCtrl) ->
  'use strict'

  NavigationBarCtrl 'NavigationBarCtrl', [
    '$scope', ($scope) ->
      console.log 'Registering Navigation Listeners'
      $('#btnLogin').click(@showRegisterForm)
  ]




