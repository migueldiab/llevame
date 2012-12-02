/**
 * Created with JetBrains WebStorm.
 * User: migueldiab
 * Date: 28/05/12
 * Time: 11:53 PM
 */
console.log("Loading App");
define([
  "jquery"
  ,"angular"
  ,'controller/home'
  ,'controller/view'
  ,"jquery.lazyload.min"
  ,"bootstrap/bootstrap-modal"
//  ,"bootstrap/bootstrap-transition"
//  ,"bootstrap/bootstrap-alert"
//  ,"bootstrap/bootstrap-dropdown"
//  ,"bootstrap/bootstrap-scrollspy"
//  ,"bootstrap/bootstrap-tab"
//  ,"bootstrap/bootstrap-tooltip"
//  ,"bootstrap/bootstrap-popover"
//  ,"bootstrap/bootstrap-button"
  ,"bootstrap/bootstrap-collapse"
//  ,"bootstrap/bootstrap-carousel"
//  ,"bootstrap/bootstrap-typeahead"
//  ,"bootstrap/bootstrap-affix"
  ,'common/validator'
],
  function ($, angular, Home, View) {

    var initialize = function () {
      console.log('Init llevame App');

      var homeController = Home.getInstance();
      var viewController = View.getInstance();

      homeController.startSlider();
      homeController.startLazyImages();
      homeController.startEventListeners();

      viewController.loadPartials();
      viewController.loginCurrentUser();



    };

    return {
      initialize: initialize
    };
  });