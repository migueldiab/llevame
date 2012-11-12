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
    ,'common/validator'
],
    function ($, angular, Home) {

        var initialize = function () {
            console.log('Init llevame App');

            var homeController = new Home();

            homeController.startSlider();
            homeController.startLazyImages();
            homeController.startEventListeners();

        };

        return {
            initialize: initialize
        };
    });