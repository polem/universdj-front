'use strict'

describe 'Controller: Mixshows/ListCtrl', () ->

  # load the controller's module
  beforeEach module 'www.universdj.comApp'

  Mixshows/ListCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller) ->
    scope = {}
    Mixshows/ListCtrl = $controller 'Mixshows/ListCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
