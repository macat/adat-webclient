App.ApplicationController = Ember.ObjectController.extend
  dashboards: (->
    App.Dashboard.find()
  ).property()

  categories: (->
    @get('dashboards').mapProperty('category').uniq()
  ).property()
