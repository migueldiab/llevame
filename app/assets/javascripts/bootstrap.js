/**
 * global define
 */

define(['require', 'angular', 'app'], function(require, angular) {
  console.log('Bootstrapping...');
  'use strict';
  return require(['domReady!'], function(document) {
    return angular.bootstrap(document, ['app']);
  });
});

