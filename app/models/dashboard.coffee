App.Dashboard = DS.Model.extend
  category: DS.attr('string')
  title: DS.attr('string')
  position: DS.attr('number')
  widgets: DS.hasMany('widget', {async: true})
