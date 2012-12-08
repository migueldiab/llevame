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
    currentUser = null

    constructor: ->
      console.log 'Starting View Controller'

    loadPartials: (mainModule) ->
      console.log 'Loading Partials'
      module = angular.module('navigation-bar', [])
      module.directive('navigationBar', @navBar)
      angular.module('llevameApp', ['navigation-bar']);
      angular.bootstrap(document, ['llevameApp'])


    navBar: =>
      console.log 'Loading Navigation Bar'
      directiveDefinitionObject = {
        restrict: 'E'
        ,replace: false
        ,templateUrl: '/partials/navigationBar.html'
        ,link: NavBarView.getInstance().linkNavBar
        ,controller: NavBarCtrl.getInstance().init
      }
      return directiveDefinitionObject

    showError: (title, error) ->
      $('#errorMsg').slideDown(400)
      $('#errorMsgTitle').text title
      $('#errorMsgText').text error


    loadUserView: =>
      $('#frmLogin').slideToggle(300, @showUser)


    showUser: =>
      $('#userNav').fadeIn(300)



  class root.ViewCtrl

    instance = undefined;

    @getInstance: ->
      instance ?= new _ViewCtrl


