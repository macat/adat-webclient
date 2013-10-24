
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
    items = widget.config.items
    items.forEach (item, index) ->
      unless item.id
        item.id = "#{ widget.id }-#{ index }"

    itemIds = items.mapProperty('id')
    widget.items = itemIds
    items

  extractProperties: (widget) ->
    for key, value of widget.config
      widget[key] = value unless key == 'items'

  extractSingle: (store, type, payload, id, requestType) ->
    @extractProperties(payload.widget)
    payload.widgetItems = @extractItems(payload.widget)
    delete payload.widget.config

    @_super(store, type, payload, id, requestType)

  extractArray: (store, primaryType, payload) ->
    payload.widgetItems = []
    payload.widgets.forEach (widget) =>
      @extractProperties(widget)
      payload.widgetItems = payload.widgetItems.concat(@extractItems(widget))
      delete widget.config

    @_super(store, primaryType, payload)

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
