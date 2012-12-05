'use strict';

requirejs.config({
  //By default load any module IDs from js
  baseUrl: 'assets'
  ,paths: {
    jquery: 'jquery-1.8.2'
    ,angular: 'angular'
    ,modernizr: 'modernizr-2.6.1-respond-1.1.0.min'
  }
  ,shim: {
    'angular': {
      exports: 'angular'
    },
    'angular-resource': {
      deps: ['angular']
    }
  }
  ,priority: [
    "jquery"
    ,"angular"
  ]

});

require([
    'llevame'
    ,'angular'
    ,'jquery'
    ,'bootstrap'
  //  , 'controllers/personController'
  //  , 'directives/ngController'
  ],
  function(llevame, angular) {
    console.log('Starting main...');
    angular.element(document).ready(function() {
      angular.bootstrap(document);
    });
    llevame.init();
  }
);


//requirejs({
//    baseUrl: 'assets'
//    ,paths: {
//        //jquery: '//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery'
//        jquery: 'jquery-1.8.2'
//        //,bootstrap: '//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min'
//        ,angular: 'angular'
//        //,opensans: 'http://use.edgefonts.net/open-sans'
//        ,llevame: 'controller/app'
//        ,modernizr: 'modernizr-2.6.1-respond-1.1.0.min'
//    }
//    ,shim: {
//      'angular' : {'exports' : 'angular'}
//      ,'angular-resource' : {deps:['angular']}
//      ,'bootstrap': {deps:['jquery']}
//  //    ,'underscore': {exports: '_'}
//    }
//    ,priority: [
//        "angular"
//    ]
//
//});
//
//// Start the main app logic.
//require(
//    [
//        'angular'
//        ,'llevame'
//        ,'controllers/controllers'
////        ,'jquery'
////        ,'angular'
////        ,'opensans'
//    ],
//    function(angular, llevame) {
//
//      angular.element(document).ready(function () {
//        console.log("App Main : " + llevame);
//        angular.bootstrap(document, ['appLlevame']);
////        llevame.initialize();
//      });
//
//    }
//);
