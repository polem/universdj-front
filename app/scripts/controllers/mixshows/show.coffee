'use strict'

angular.module('www.universdj.comApp')
    .controller 'MixshowShowCtrl', (em, $routeParams, $scope) ->

        em.getRepository('mixshow').find($routeParams.id).then((mixshow) ->
            $scope.mixshow = mixshow
            return
        )

        $scope.messages = []

        $scope.addMessage = () ->
            message = {}
            message.date = new Date()
            angular.copy($scope.newMessage, message)
            $scope.messages.push(message)
            $scope.newMessage = {}

        return
