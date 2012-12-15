define ['common/MenuItem'], (MenuItem) ->
  root = exports ? this

  class _PerfilBarView

    constructor: ->
      console.log 'Loading PerfilBar View'


    link: ($scope) =>
      console.log 'Linking Perfil Bar'
      this.configureMenuItems($scope)

    configureMenuItems: ($scope) =>
      personal = new MenuItem('Personal', 'ProfileView.getInstance().load()')
      rep = new MenuItem('Reputacion', 'RepView.getInstance().load()')
      vehiculo = new MenuItem('Vehiculo', 'VehicleView.getInstance().load()')
      $scope.perfilMenu = [personal, rep, vehiculo]


  class root.PerfilBarView

    instance = undefined;

    @getInstance: ->
      instance ?= new _PerfilBarView


