define ['common/MenuItem'], (MenuItem) ->
  root = exports ? this

  class _ProfileBarView

    constructor: ->
      console.log 'Loading Profile Bar View'


    link: ($scope) =>
      console.log 'Linking Profile Bar'
      this.configureMenuItems($scope)

    configureMenuItems: ($scope) =>
      personal = new MenuItem('Personal', 'View.getInstance().loadProfile()')
      rep = new MenuItem('Reputacion', 'View.getInstance().loadRep()')
      vehiculo = new MenuItem('Vehiculo', 'VehicleView.getInstance().load()')
      $scope.profileMenu = [personal, rep, vehiculo]


  class root.ProfileBarView

    instance = undefined;

    @getInstance: ->
      instance ?= new _ProfileBarView


