

App.Widget = DS.Model.extend
  created: DS.attr('date')
  type: DS.attr('string')
  dashboard: DS.belongsTo('dashboard')
  #config: DS.belongsTo('App.WidgetConfig', embedded: 'always')
  config: DS.attr('object')

  typeView: (->
    App[@get('type') + 'View']
  ).property('type')

  title: (->
    @get('config').title
  ).property('config')

  #App.WidgetConfig = DS.Model.extend
  #  type: DS.attr('string')
  #  items: DS.hasMany('App.WidgetItem', embedded: 'always')
  #  granuality: DS.attr('number')
  #  fromRelative: DS.attr('number')
  #
  #App.WidgetItem = DS.Model.extend
  #  type: DS.attr('string')
  #  title: DS.attr('string')
  #  color: DS.attr('string')
  #
  #  dataType: DS.attr('string')
  #  dataMetric: DS.attr('string')
  #  dataChannel: DS.attr('string')
