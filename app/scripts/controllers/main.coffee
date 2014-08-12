'use strict'

###*
 # @ngdoc function
 # @name netteLogViewerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the netteLogViewerApp
###
angular.module('netteLogViewerApp')
  .controller 'MainCtrl', ($scope, $http, $timeout, localStorageService) ->
    timeout = null
    $scope.baseUrl = 'http://localhost/nette-log-viewer/'
    $scope.autoReload = localStorageService.get('autoReload') || 0
    $scope.fullWidth = localStorageService.get('fullWidth') || 0
    $scope.reloadMessage = 'Loading...'
    $http.get($scope.baseUrl + 'server/list.php').success (data) ->
      $scope.data = data
      $scope.reloadMessage = 'Reload'
      timeout = $timeout($scope.reload, 5000) if $scope.autoReload

    $scope.paginate = (data, page = 1, limit = 10) ->
      from = (page-1) * limit
      to = from + limit
      data[from..to]

    $scope.reload = ->
      $scope.reloadMessage = 'Loading...'
      $http.get($scope.baseUrl + 'server/list.php').success (data) ->
        $scope.data = data
        $scope.reloadMessage = 'Reload'
        $timeout.cancel(timeout) if timeout
        timeout = $timeout($scope.reload, 5000) if $scope.autoReload

    $scope.$watch 'autoReload', ->
      localStorageService.add('autoReload', $scope.autoReload)

    $scope.$watch 'fullWidth', ->
      localStorageService.add('fullWidth', $scope.fullWidth)
