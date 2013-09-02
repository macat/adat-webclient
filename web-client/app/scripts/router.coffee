App.Router.map ->
  @route("login")
  @resource "users"
  @resource "user", { path: 'users/:id'}
  @resource "dashboard", path: 'dashboards/:dashboard_id'
