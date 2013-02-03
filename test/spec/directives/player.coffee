'use strict'

describe 'Directive: player', () ->
  beforeEach module 'www.universdj.comApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<player></player>'
    element = $compile(element) $rootScope
    expect(element text()).toBe 'this is the player directive'
