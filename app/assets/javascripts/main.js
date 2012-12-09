'use strict';

requirejs.config({
  //By default load any module IDs from js
  baseUrl: 'assets'
  ,paths: {
    jquery: 'jquery-1.8.2'
    ,angular: 'angular'
    ,modernizr: 'modernizr-2.6.1-respond-1.1.0.min'
    ,opensans: 'open-sans'
    ,bootstrapModal: "bootstrap/bootstrap-modal"
    ,bootstrapAlert: "bootstrap/bootstrap-alert"
    ,bootstrapCollapse: "bootstrap/bootstrap-collapse"
  }
  ,shim: {
    'angular': {
      exports: 'angular'
    },
    'angular-resource': {
      deps: ['angular']
    },
    'bootstrapModal': {
      deps: ['jquery']
    },
    'bootstrapAlert': {
      deps: ['jquery']
    },
    'bootstrapCollapse': {
      deps: ['jquery']
    }
  }
  ,priority: [
    "jquery"
    ,"angular"
  ]

});

require([
    'llevame'
    ,'jquery'
    ,'angular'
    ,"bootstrapModal"
    ,"bootstrapAlert"
    ,"bootstrapCollapse"
    ,'opensans'
  //  , 'controllers/personController'
  //  , 'directives/ngController'
  ],
  function(Llevame, $) {
    console.log('Starting main...');
    var llevame = new Llevame();
    llevame.init();
  }
);

