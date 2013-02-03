'use strict'

describe 'Controller: Mixshow/ShowCtrl', () ->

  # load the controller's module
  beforeEach module 'www.universdj.comApp'

  Mixshow/ShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller) ->
    scope = {}
    Mixshow/ShowCtrl = $controller 'Mixshow/ShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
