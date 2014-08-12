'use strict'

###*
 # @ngdoc overview
 # @name netteLogViewerApp
 # @description
 # # netteLogViewerApp
 #
 # Main module of the application.
###
angular
  .module('netteLogViewerApp', [
    'ngSanitize'
    'ngTouch'
    'ui.bootstrap'
    'LocalStorageModule'
  ])
  .config (localStorageServiceProvider) ->
    localStorageServiceProvider.setPrefix('nlw')


