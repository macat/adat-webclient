

app.factory 'Page', ($http, Restangular) ->
  pages = Restangular.all('dashboards')

  pages: pages
  get: (id) -> Restangular.one('dashboards', id).get()
  create: (page) -> pages.post(page)
