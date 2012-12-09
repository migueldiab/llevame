define ['angular'], (angular) ->

  controllerModule = angular.module('llevameApp', [])

  controllerModule.controller('llevameCtrl', ['$scope'], ($scope) ->

    $scope.searchTrip = ->
      console.log('Searching Trip')


  )

