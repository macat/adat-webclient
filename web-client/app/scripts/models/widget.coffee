
App.Widget = DS.Model.extend
  created: DS.attr('string')
  type: DS.attr('string')
  dashboard: DS.belongsTo("dashboard")
