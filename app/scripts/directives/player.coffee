'use strict';

angular.module('www.universdj.comApp')
    .directive('player', (soundmanager, $timeout) ->
        templateUrl: 'views/player.html'
        scope: true
        restrict: 'A'
        link: (scope, element, attrs) ->

            scope.player =
                'currentTrack' : {}
                'time' :
                    'position' : 0
                    'duration' : 0

            scope.update = (track) ->
                scope.player.currentTrack = track.metadatas
                scope.player.time.position = numeral(track.getPosition()/1000).format('00:00')
                scope.player.time.duration = numeral(track.getDuration()/1000).format('00:00')
                scope.player.time.progress = Math.round(track.getPosition() * 100 / track.getDuration()) / 100
                scope.player.playState = not track.getSMSoundObject().paused
                if not scope.$$phase
                    scope.$apply()

            scope.getPlaylist = () ->
                soundmanager.getPlaylist()

            scope.pause = () ->
                soundmanager.pause()

            scope.resume = () ->
                soundmanager.resume()

            scope.togglePlayPause = () ->
                if scope.player.playState then soundmanager.pause() else soundmanager.resume()

            $('.audioplayer').addClass('audioplayer-playing')


            $('.audioplayer-bar').bind('click', (event) ->
                progress = Math.round(event.offsetX * 100 / $(@).width()) / 100
                track = soundmanager.getCurrentTrack()
                track.setProgress(progress)
            )

            soundmanager.addListener(scope.update)
    )

