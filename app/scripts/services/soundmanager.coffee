'use strict';

angular.module('www.universdj.comApp')
    .factory 'soundmanager', ($q, $rootScope) ->

        class Track
            constructor: (options, metadatas) ->
                @SMSoundObject = soundManager.createSound(options)
                metadatas.cover = "http://placehold.it/52x52"
                @metadatas = metadatas
            play: (options) ->
                @SMSoundObject.play(options)
            pause: () ->
                @SMSoundObject.pause()
            resume: () ->
                @SMSoundObject.resume()
            stop: () ->
                @SMSoundObject.stop()
            setProgress: (progress) ->
                @SMSoundObject.setPosition(progress * @getDuration())
            getPosition: () ->
                return @SMSoundObject.position
            getDuration: () ->
                return @SMSoundObject.durationEstimate
            getSMSoundObject: () ->
                return @SMSoundObject

        class Player
            constructor: () ->
                @listeners = []
                @playlist = []
                @currentTrack = null

            init: () ->
                console.log('init call')
                deferred = $q.defer()
                self = @
                soundManager.setup(
                    url: '/components/soundmanager/swf'
                    flashVersion: 9
                    onready: () ->
                        $rootScope.$apply () ->
                            deferred.resolve('test')
                    ontimeout: () ->
                    defaultOptions:
                         volume: 100
                )

                return deferred.promise

            addListener: (listener) ->
                @listeners.push(listener)
            fireListeners: () ->
                listener(@currentTrack) for listener in @listeners
            play: (datas) ->
                self = @

                if @currentTrack != null
                    @currentTrack.getSMSoundObject().destruct()

                track = new Track({id: 'udj', url: datas.url}, datas)

                track.play(
                    whileplaying: () ->
                        self.fireListeners()
                    onpause: () ->
                        self.fireListeners()
                    onresume: () ->
                        self.fireListeners()
                    onfinish: () ->
                        self.fireListeners()
                )

                @currentTrack = track
                @playlist.push(track)
            pause: () ->
                @currentTrack.pause()
            resume: () ->
                @currentTrack.resume()
            getCurrentTrack: () ->
                return @currentTrack
            getPlaylist: () ->
                return @playlist

        player = new Player();

        return player
