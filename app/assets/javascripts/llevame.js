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
  function (Home, View, User, angular) {
    var init = function () {
      console.log('Running App...');
      'use strict';

      var llevameMod = angular.module('llevameApp', []);
      llevameMod.value('appName', 'Llevame.uy');

      angular.element(document).ready(function() {
        angular.bootstrap(document, ['llevameApp']);
      });


      var homeController = Home.getInstance();
      var viewController = View.getInstance();
      var userController = User.getInstance();

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


