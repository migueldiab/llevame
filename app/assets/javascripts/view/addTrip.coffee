root = exports ? this

class _AddTripView

  scope = null

  constructor: ->
    scope = angular.element(document).scope()

  load: =>
    ###
      The Loading of this view is dependent on the user having a vehicle
      So if there are no vehicles, he should be redirected to the Profile->Vehicle view
    ###
    VehicleCtrl.getInstance().getUserVehicles(AddTripView.getInstance().processVehicles)

  initView: =>
    console.log 'Nuevo Viaje'

  processVehicles: (data, status, headers, config) =>
    console.log 'Processing Vehicles'
    if (200 == status)
      if (data.length > 0)
        console.log "Loaded Vehicles : #{data.length}"
        VehicleCtrl.getInstance().loadVehicles(data)
        scope.addTrip = this.addTrip
        scope.cancelar = SearchView.getInstance().load
        scope.init = this.initView
        scope.mainContent = 'partials/addTrip.html'
#          VehicleView.getInstance().loadVehicleView()
        TripCtrl.getInstance().newTrip()
      else
        ###
          Redirects to Vehicle No Vehicle View
        ###
        scope.init = View.getInstance().loadVehicleView
        scope.mainContent = 'partials/profile.html'
#          scope.initVehicle = this.noVehicle
#          scope.vehicleContent = 'partials/noVehicle.html'


  addTrip: =>
    console.log 'Agregando Viaje'
    if (this.validarFormulario())
      console.log 'Form Valido'
      TripCtrl.getInstance().addTrip()

  validarFormulario: =>
    console.log 'Validando Formulario'
    return true

#    controller = ->
#      ng-controller="AddTripView.getInstance().controller()"
#      console.log 'Agregar Controller'


class root.AddTripView

  instance = undefined;

  @getInstance: ->
    instance ?= new _AddTripView


