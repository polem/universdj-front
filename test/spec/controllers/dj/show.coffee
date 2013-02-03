'use strict'

describe 'Controller: Dj/ShowCtrl', () ->

  # load the controller's module
  beforeEach module 'www.universdj.comApp'

  Dj/ShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller) ->
    scope = {}
    Dj/ShowCtrl = $controller 'Dj/ShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
