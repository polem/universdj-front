'use strict';

angular.module('www.universdj.comApp')
  .factory 'user', ($rootScope, api) ->

      class User
          constructor: () ->
              @authenticated = false
              @likes = new Array()
              return

          like: (object) ->
              @likes.push(object)
              return

          login: (login, password) ->

              api.post('/users/auth', { 'user' : {
                  'login': login
                  'password' : password
              }});

              if login == 'polem' and password == 'test'
                  @login = login
                  $rootScope.closeLoginModal()
                  @authenticated = true
                  return

          logout: () ->
              delete @login
              return

          isAuthenticated: () ->
              return @authenticated


      return new User()

