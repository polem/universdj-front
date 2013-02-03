'use strict';

angular.module('www.universdj.comApp')
    .directive('audio', (soundmanager) ->
        restrict: 'A'
        link: (scope, element, attrs) ->
            element.bind 'click', (event) ->
                soundmanager.play(
                    url: attrs.href
                    title: attrs.title
                    artist: attrs.artist
                )

                event.preventDefault()
    )

