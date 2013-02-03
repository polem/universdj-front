'use strict'

app = angular.module('www.universdj.comApp', [])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/mixshows',
        templateUrl: 'views/mixshows/list.html'
        controller: 'MixshowListCtrl'
      .when '/mixshows/:id',
        templateUrl: 'views/mixshows/show.html'
        controller: 'MixshowShowCtrl'
      .when '/djs/:id',
        templateUrl: 'views/djs/show.html'
        controller: 'DjShowCtrl'
      .otherwise
        redirectTo: '/'
  ]

app.run ($rootScope, soundmanager, $q) ->

    $rootScope.playerReady = false

    $rootScope.initPlayer = () ->
        soundmanager.init().then () ->
            $rootScope.playerReady = true

    $rootScope.openPlayer = () ->
        $('#player').addClass('opened')

    $rootScope.closePlayer = () ->
        $('#player').removeClass('opened')

    $rootScope.initPlayer()
