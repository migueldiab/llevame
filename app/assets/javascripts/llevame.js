/**
 * Created with JetBrains WebStorm.
 * User: migueldiab
 * Date: 28/05/12
 * Time: 11:53 PM
 */

/**
 * global define
 */

define([
    'controller/home'
    ,'controller/view'
    ,'controller/user'
    ,'angular'
    ,'jquery'
    ,"jquery.lazyload.min"
    ,'common/validator'
  ],
  function (HomeCtrl, ViewCtrl, UserCtrl, angular) {
    var init = function () {
      console.log('Running App...');
      'use strict';

      var llevameMod = angular.module('llevameApp', []);
      llevameMod.value('appName', 'Llevame.uy');

      angular.element(document).ready(function() {
        angular.bootstrap(document, ['llevameApp']);
      });


      var homeController = HomeCtrl.getInstance();
      var viewController = ViewCtrl.getInstance();
      var userController = UserCtrl.getInstance();

      viewController.loadPartials(llevameMod);

      homeController.startSlider();
      homeController.startLazyImages();
      homeController.startEventListeners();

      userController.loginCurrentUser();

    };

    return {
      init: init
    };
});


