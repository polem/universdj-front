'use strict'

angular.module('www.universdj.comApp')
    .controller 'MainCtrl', (em, $scope) ->

        em.getRepository('mixshow').findAll().then((mixshows) ->
            console.log(mixshows)
            $scope.mixshows = mixshows
            return
        )

        return
