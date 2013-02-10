'use strict';

angular.module('www.universdj.comApp')
  .factory 'api', ['$http', ($http) ->

      class Api
          constructor: (url) ->
              @url = url

          request: (options) ->
              options.url = @url + options.url
              console.log(options)
              return $http(options)

          get: (endpoint) ->

              options = {
                  url: endpoint
                  method: 'GET'
              }

              return @request(options)

          post: (endpoint, datas) ->

              options =
                  url: endpoint
                  data: datas
                  method: 'POST'

              return @request(options)

          delete: (endpoint) ->

              options =
                  url: endpoint
                  method: 'DELETE'

              return @request(options)

      return new Api('http://api.universdj.com.local/api.php')

  ]
