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
    ,'controller/navigationBar'
    ,'jquery'
    ,'angular'
    ,"jquery.lazyload.min"
    ,"bootstrap/bootstrap-modal"
    ,'common/validator'
  ],
  function (Home, View, User) {
    var init = function () {
      console.log('Running App...');
      'use strict';
      var homeController = Home.getInstance();
      var viewController = View.getInstance();
      var userController = User.getInstance();

      viewController.loadPartials();

      homeController.startSlider();
      homeController.startLazyImages();
      homeController.startEventListeners();

      userController.loginCurrentUser();
    };

    return {
      init: init
    };
});


