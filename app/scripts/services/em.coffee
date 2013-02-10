'use strict';

angular.module('www.universdj.comApp')
  .factory 'em', ['api', '$q', (api, $q) ->

      modelFactory = new ModelFactory()

      class Repository
          constructor: (name) ->
              @name = name

          findAll: () ->
              deferred = $q.defer()
              self = @
              api.get('/' + @name + 's/').then(
                  (response) ->
                      deferred.resolve(new Collection(self.name, response.data[self.name + 's']))
                      return
                  ,
                  (response) ->
                      deferred.reject()
                      return
              )

              return deferred.promise

          find: (id) ->
              deferred = $q.defer()
              self = @
              api.get('/' + @name + 's/' + id).then(
                  (response) ->
                      deferred.resolve(response.data[self.name])
                      return
                  ,
                  (response) ->
                      deferred.reject()
                      return
              )

              return deferred.promise


      class EntityManager
          constructor: () ->

          getRepository: (repositoryName) ->
              return new Repository(repositoryName)

      return new EntityManager()

  ]
