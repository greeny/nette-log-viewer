'use strict'

###*
 # @ngdoc filter
 # @name netteLogViewerApp.filter:paginate
 # @function
 # @description
 # # paginate
 # Filter in the netteLogViewerApp.
###
angular.module('netteLogViewerApp')
  .filter 'paginate', ($log)->
    (input, page, limit) ->
      from = (page-1) * limit
      to = from + limit
      $log.info from, to

      input[from..to]
