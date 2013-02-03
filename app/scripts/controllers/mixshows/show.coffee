'use strict'

angular.module('www.universdj.comApp')
    .controller 'MixshowShowCtrl', ($http, $routeParams, $scope) ->


        $http.get('http://api.universdj.com.local/api.php/mixshows/' +  $routeParams.id).success (datas) ->
            console.log datas
            $scope.mixshow = datas.mixshow
            return

        return
