App = window.App = Ember.Application.create()

App.inject 'route', 'session', 'controller:session'

# Order and include as you please.
require 'scripts/controllers/*'
require 'scripts/session'
require 'scripts/store'
require 'scripts/models/*'
require 'scripts/routes/*'
require 'scripts/views/*'
require 'scripts/router'

