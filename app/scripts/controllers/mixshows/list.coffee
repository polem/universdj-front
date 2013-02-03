'use strict'

angular.module('www.universdj.comApp')
    .controller 'MixshowListCtrl', ($http, $scope) ->
        $http.get('http://api.universdj.com.local/api.php/mixshows/').success (datas) ->
            console.log datas
            $scope.mixshows = datas.mixshows
            return

        return
