
App.ChartView = Ember.View.extend
  classNames: ['chart']
  templateName: 'chart'
  layoutName: 'widget'

  didInsertElement: ->
    elementId = @get('elementId');

    margin =
      top: 20
      right: 20
      bottom: 30
      left: 50

    width = 960 - margin.left - margin.right
    height = 500 - margin.top - margin.bottom
    parseDate = d3.time.format("%d-%b-%y").parse
    x = d3.time.scale().range([0, width])
    y = d3.scale.linear().range([height, 0])
    xAxis = d3.svg.axis().scale(x).orient("bottom")
    yAxis = d3.svg.axis().scale(y).orient("left")

    svg = d3.select("##{ elementId }").append("svg").attr("width", width + margin.left + margin.right).attr("height", height + margin.top + margin.bottom).append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")")
    line = d3.svg.line().x((d) -> x(d.time)).y((d)-> y(d.value));
    d3.csv "http://localhost:5999/?type=archive&from=1319760000&length=43200&granularity=1440&metric=akarmi.pages&channels=counter", (error, data) ->
      data.forEach (d) ->
        d.time = new Date(d.time*1000)
        d.value = Math.abs(parseFloat(d.value))
      console.log(data)

      x.domain d3.extent(data, (d) -> d.time)
      y.domain d3.extent(data, (d) -> d.value)
      svg.append("path").datum(data).attr("class", "value").attr "d", line
      svg.append("g").attr("class", "x axis").attr("transform", "translate(0," + height + ")").call xAxis
      svg.append("g").attr("class", "y axis").call(yAxis).append("text").attr("transform", "rotate(-90)").attr("y", 6).attr("dy", ".71em").style("text-anchor", "end").text "Price ($)"
