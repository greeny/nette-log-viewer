'use strict'

angular.module('netteLogViewerApp')
  .factory 'ListFactory', ($resource) ->
    $resource('http://localhost/nette-log-viewer/server/list.php')
