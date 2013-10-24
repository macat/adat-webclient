
App.Widget = DS.Model.extend
  created: DS.attr('date')
  type: DS.attr('string')
  dashboard: DS.belongsTo('dashboard')
  #config: DS.belongsTo('App.WidgetConfig', embedded: 'always')
  items: DS.hasMany('widgetItem')
  title: DS.attr('string')

  typeView: (->
    App[@get('type') + 'View']
  ).property('type')

App.WidgetSerializer = DS.RESTSerializer.extend
  extractItems: (widget) ->
    items = widget.items
    items.forEach (item, index) ->
      unless item.id
        item.id = index

    itemIds = items.mapPropery('id')
    payload.widget.items = itemIds
    items

  extractSingle: (store, type, payload, id, requestType) ->
    for key, value of payload.widget.config
      payload.widget[key] = value
    delete payload.widget.config

    payload.widgetItems = @extractItems(payload.widget)

    @_super.apply(@, arguments_)

  extractArray: (store, primaryType, payload) ->
    payload.widgetItems = []
    payload.widgets.forEach (widget) =>
      payload.widgetItems = payload.widgetItems.concat(@extractItems(widget))

    @_super.apply(@, arguments_)

  serialize: (record, options) ->
    {
      id: record.get('id')
      type: record.get('type')
      dashboard: record.get('dashboard').get('id')
      config: {
        title: record.get('title')
        items: record.get('items').map((item) -> item.toJSON())
      }
    }


App.WidgetItem = DS.Model.extend
  widget: DS.belongsTo('widget')
  type: DS.attr('string')
  title: DS.attr('string')
  color: DS.attr('string')
  dataType: DS.attr('string')
  dataMetric: DS.attr('string')
  dataChannel: DS.attr('string')
