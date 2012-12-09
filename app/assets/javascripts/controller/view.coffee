define [
  'angular'
  ,'view/navigationBar'
  ,'controller/navigationBar'
],
(
  angular
  ,NavBarView
  ,NavBarCtrl
) ->

  root = exports ? this

  class _ViewCtrl
    scope = null

    constructor: ->
      console.log 'Starting View Controller'

    showError: (title, error) ->
      $('#errorMsg').slideDown(400)
      $('#errorMsgTitle').text title
      $('#errorMsgText').text error


    loadUserView: =>
      $('#mainContent').html '<h3>Loading Trips... pelase wait...</h3>'
      $('#frmLogin').slideToggle(300, @showUser)



    showUser: =>
      $('#userNav').fadeIn(300)



  class root.ViewCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _ViewCtrl


