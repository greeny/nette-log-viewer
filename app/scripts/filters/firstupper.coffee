'use strict'

###*
 # @ngdoc filter
 # @name netteLogViewerApp.filter:firstUpper
 # @function
 # @description
 # # firstUpper
 # Filter in the netteLogViewerApp.
###
angular.module('netteLogViewerApp')
  .filter 'firstUpper', ->
    (input) ->
      input.charAt(0).toUpperCase() + input.slice(1)
