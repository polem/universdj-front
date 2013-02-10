'use strict'

angular.module('www.universdj.comApp')
    .controller 'DjShowCtrl', (em, $routeParams, $scope) ->

        em.getRepository('dj').find($routeParams.id).then((dj) ->
            $scope.dj = dj
            return
        )

        return
