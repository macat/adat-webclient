App = window.App = Ember.Application.create()
App.inject 'route', 'session', 'controller:session'

# Order and include as you please.
require 'utils/*'
require 'components/*'
require 'controllers/*'
require 'models/*'
require 'routes/*'
require 'views/*'
require 'router'


DS.ObjectTransform = DS.Transform.extend
  deserialize: (x) -> Em.Object.create(if Em.isNone(x) then {} else x)
  serialize: (x) -> if Em.isNone(x) then {} else x


App.initializer
  name: "objectTransform"
  initialize: (container, application) ->
    application.register('transform:object', DS.ObjectTransform);

App.Store = DS.Store.extend({})


