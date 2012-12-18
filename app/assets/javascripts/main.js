'use strict';

requirejs.config({
  //By default load any module IDs from js
  baseUrl: 'assets'
  ,paths: {
    jQuery: 'jquery-1.8.2'
    ,jQueryUi: 'jquery-ui'
    ,angular: 'angular'
    ,angularUi: 'angular-ui'
    ,modernizr: 'modernizr-2.6.1-respond-1.1.0.min'
    ,opensans: 'open-sans'
    ,bootstrapModal: "bootstrap/bootstrap-modal"
    ,bootstrapAlert: "bootstrap/bootstrap-alert"
    ,bootstrapCollapse: "bootstrap/bootstrap-collapse"
    ,bootstrapTime: "bootstrap/bootstrap-timepicker"
//    ,bootstrapDate: "bootstrap/bootstrap-datepicker"
    ,bootstrapDropdown: "bootstrap/bootstrap-dropdown"
    ,bootstrapDateEs: "bootstrap/bootstrap-datepicker.es"
  }
  ,shim: {
    'angular': {
      exports: 'angular'
    },
    'jQueryUi': {
      deps: ['jQuery']
    },
    'angularUi': {
      deps: ['angular']
    },
    'angular-resource': {
      deps: ['angular']
    },
    'bootstrapDateEs': {
      deps: ['bootstrapDate']
    },
    'bootstrapDropdown': {
      deps: ['jquery']
    },
    'bootstrapTime': {
      deps: ['jquery']
    },
    'bootstrapDate': {
      deps: ['jquery']
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
    "jQuery"
    ,"jQueryUi"
    ,"angular"
    ,"angularUi"
  ]

});

require([
    'llevame'
    ,'jQuery'
    ,'jQueryUi'
    ,'angular'
    ,'angularUi'
    ,"bootstrapModal"
    ,"bootstrapAlert"
    ,"bootstrapCollapse"
    ,"bootstrapDropdown"
    ,"bootstrapTime"
//    ,"bootstrapDate"
//    ,"bootstrapDateEs"
//    ,"Hydrate"
    ,'opensans'
  //  , 'controllers/personController'
  //  , 'directives/ngController'
  ],
  function(Llevame) {
    console.log('Starting main...');
    var llevame = new Llevame();
    llevame.init();
  }
);

