'use strict'

angular.module('www.universdj.comApp')
    .controller 'DjShowCtrl', ($routeParams, $http, $scope) ->
        $http.get('http://api.universdj.com.local/api.php/djs/' +  $routeParams.id).success (datas) ->
            $scope.dj = datas.dj
            return

        return
