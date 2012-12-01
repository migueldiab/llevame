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
    ,"jquery.lazyload.min"
    ,"bootstrap/bootstrap-modal"
//    ,"bootstrap/bootstrap-transition"
//    ,"bootstrap/bootstrap-alert"
//    ,"bootstrap/bootstrap-dropdown"
//    ,"bootstrap/bootstrap-scrollspy"
//    ,"bootstrap/bootstrap-tab"
//    ,"bootstrap/bootstrap-tooltip"
//    ,"bootstrap/bootstrap-popover"
//    ,"bootstrap/bootstrap-button"
    ,"bootstrap/bootstrap-collapse"
//    ,"bootstrap/bootstrap-carousel"
//    ,"bootstrap/bootstrap-typeahead"
//    ,"bootstrap/bootstrap-affix"
    ,'common/validator'
],
    function ($, angular, Home) {

        var initialize = function () {
            console.log('Init llevame App');

            var homeController = new Home();

            homeController.startSlider();
            homeController.startLazyImages();
            homeController.startEventListeners();
            homeController.loginUserOrDisplayForm();

        };

        return {
            initialize: initialize
        };
    });