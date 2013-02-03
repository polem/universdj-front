'use strict';

angular.module('www.universdj.comApp')
    .directive('player', (soundmanager, $timeout) ->
        templateUrl: 'views/player.html'
        scope: true
        restrict: 'A'
        link: (scope, element, attrs) ->

            class Player
                constructor: () ->
                    @currentTrack = {}
                    @time =
                        'position' : ''
                        'duration' : ''

                update: (track) ->
                    @currentTrack = track.metadatas
                    @time.position = numeral(track.getPosition()/1000).format('00:00')
                    @time.duration = numeral(track.getDuration()/1000).format('00:00')
                    @time.progress = Math.round(track.getPosition() * 100 / track.getDuration()) / 100
                    @paused = track.getSMSoundObject().paused
                    if not scope.$$phase
                        scope.$apply()

                getPlaylist: () ->
                    soundmanager.getPlaylist()

                pause: () ->
                    soundmanager.pause()

                resume: () ->
                    soundmanager.resume()

                togglePlayPause: () ->
                    if @paused then @resume() else @pause()


            scope.player = new Player()

            $('.audioplayer-bar').bind('click', (event) ->
                progress = Math.round(event.offsetX * 100 / $(@).width()) / 100
                track = soundmanager.getCurrentTrack()
                track.setProgress(progress)
            )

            soundmanager.addListener((track) -> scope.player.update(track))
    )

