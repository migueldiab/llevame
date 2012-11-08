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
    ,'home'
],
    function ($, angular, home) {

        var initialize = function () {
            console.log('Initialized');
        };

        return {
            initialize: initialize
        };
    });