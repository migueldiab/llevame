define ['controller/home'], (Home) ->
  'use strict'

  NavigationBarCtrl: ->
    console.log 'Registering Navigation Listeners'
    homeController = Home.getInstance
    $('#btnLogin').click(homeController.showRegisterForm)







