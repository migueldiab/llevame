class @Llevame

  init: =>
    this.initModules()
    this.initControllers()

  initModules: =>
    console.log('Starting App...')

    navBarMod = angular.module('navigation-bar', [])
    navBarMod.directive('navigationBar', @navBar)

    profileBarMod = angular.module('profile-bar', [])
    profileBarMod.directive('profileBar', @profileBar)

    llevameMod = angular.module('llevameApp', ['ui', 'navigation-bar', 'profile-bar'])

#    CSRF Angular-Rails Headers from https://github.com/xrd/ng-rails-csrf/blob/master/vendor/assets/javascripts/ng-rails-csrf.js
    llevameMod.config(['$httpProvider', ($httpProvider) ->
        authToken = $('meta[name="csrf-token"]').attr('content')
        $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken
      ])

    llevameMod.value('ui.config', {
      jq: {
        datepicker:  {
          format: 'dd/mm/yyyy'
          startDate: 'new Date()'
          language: 'es'
          language: 'es'
        }
        timepicker:  {
          minuteStep: 15
          showSeconds: false
          showMeridian: true
        }
      }
    })

    llevameMod.run ($rootScope) ->
      $rootScope.author = 'Miguel A. Diab'

      $rootScope.executeMenu = (aMenuItem) ->
        console.log 'Menu : ' + aMenuItem.getAction()
        eval(aMenuItem.getAction())
      router = View.getInstance()
      $rootScope.profile = router.loadProfile
      $rootScope.notifications = router.loadNotifications
      $rootScope.aboutUs = router.loadAboutUs

#      $rootScope.datePickerOpts = {
#        format: 'dd/mm/yyyy'
#        startDate: 'new Date()'
#        language: 'es'
#        language: 'es'
#      }


    angular.bootstrap document, ['llevameApp', 'navigation-bar']

  initControllers: =>
    console.log 'Init Llevame Controllers'
    UserCtrl.getInstance().loginCurrentUser()

  navBar: =>
    console.log 'Loading Navigation Bar'
    directiveDefinitionObject = {
      restrict: 'E'
      ,replace: false
      ,templateUrl: '/partials/navigationBar.html'
      ,link: NavBarView.getInstance().link
#        ,controller: NavBarCtrl.getInstance
    }
    return directiveDefinitionObject

  profileBar: =>
    console.log 'Loading Profile Bar'
    directiveDefinitionObject = {
      restrict: 'E'
      ,replace: false
      ,templateUrl: '/partials/profileBar.html'
      ,link: ProfileBarView.getInstance().link
      ,controller: ProfileBarCtrl.getInstance
    }
    return directiveDefinitionObject
