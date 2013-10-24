App.ColorPickerComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['color-picker']
  actions:
    colorpick: (color)->
      @set('color', color)
  swatches:
    [
      '#000',
      '#E44424',
      '#67BCDB',
      '#A2AB58',
      '#404040',
      '#FFE658',
      '#118C4E',
      '#C1E1A6',
      '#DF3D82'
    ]

  colorStyle: (->
    "background-color: #{ @get('color') }"
  ).property('color')

