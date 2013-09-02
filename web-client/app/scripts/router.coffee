App.Router.map ->
  @route "login"
  @route "logout"
  @resource "users"
  @resource "user", { path: 'users/:id'}
  @resource "dashboard", path: 'dashboards/:dashboard_id'
