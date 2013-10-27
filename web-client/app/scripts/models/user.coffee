App.User = DS.Model.extend
  created: DS.attr('string')
  email: DS.attr('string')
  name: DS.attr('string')
  groups: DS.hasMany('group', async: true)
  permissions: DS.attr()
