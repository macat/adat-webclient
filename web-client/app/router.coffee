App.Router.map ->
  @route "login"
  @route "logout"
  @resource "admin", path: '/admin', ->
    @resource "users", ->
      @resource "user", path: ':id'
    @resource "groups", ->
      @resource "group", path: ':id'

  @resource "dashboard", path: 'dashboards/:dashboard_id'

