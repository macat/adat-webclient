App.Group = DS.Model.extend
  name: DS.attr('string')
  permissions: DS.attr()
  created: DS.attr('date')
