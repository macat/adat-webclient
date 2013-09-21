App.ClockView = Ember.View.extend
  classNames: ['clock']
  templateName: 'clock'
  layoutName: 'widget'

  time: ->
    currentTime = new Date()

    second = currentTime.getSeconds()
    minute = currentTime.getMinutes()
    hour = currentTime.getHours() + minute/60

    data = [
      "unit": "seconds"
      "numeric": second
    ,
      "unit": "minutes"
      "numeric": minute
    ,
      "unit": "hours"
      "numeric": hour
    ]

  didInsertElement: ->
    elementId = @get('elementId');

    width = 400
    height = 200
    offSetX = 150
    offSetY = 100

    pi = Math.PI
    scaleSecs = d3.scale.linear().domain([1,60 + 999/1000]).range([0,2*pi])
    scaleMins = d3.scale.linear().domain([0,59 + 59/60]).range([0,2*pi])
    scaleHours = d3.scale.linear().domain([0,11 + 59/60]).range([0,2*pi])

    vis = d3.select("##{elementId}")
        .append("svg:svg")
        .attr("width", width)
        .attr("height", height)
    clockGroup = vis
        .append("svg:g")
        .attr("transform", "translate(" + offSetX + "," + offSetY + ")" )

    clockGroup.append("svg:circle")
        .attr("r", 80)
        .attr("fill", "none")
        .attr("class", "clock outercircle")
        .attr("stroke", "black")
        .attr("stroke-width", 2)

    clockGroup.append("svg:circle")
        .attr("r", 4)
        .attr("fill", "black")
        .attr("class", "clock innercircle")


    render =(data)->
        clockGroup.selectAll(".clockhand").remove()

        secondArc = d3.svg.arc()
            .innerRadius(0)
            .outerRadius(70)
            .startAngle((d)-> scaleSecs(d.numeric))
            .endAngle((d)-> scaleSecs(d.numeric))

        minuteArc = d3.svg.arc()
            .innerRadius(0)
            .outerRadius(70)
            .startAngle((d)-> scaleMins(d.numeric))
            .endAngle((d)-> scaleMins(d.numeric))

        hourArc = d3.svg.arc()
            .innerRadius(0)
            .outerRadius(50)
            .startAngle((d)-> scaleHours(d.numeric%12))
            .endAngle((d)-> scaleHours(d.numeric%12))
        clockGroup.selectAll(".clockhand")
            .data(data)
            .enter()
            .append("svg:path")
            .attr("d", (d)->
                if d.unit is "seconds"
                  secondArc(d)
                else if d.unit is "minutes"
                  minuteArc(d)
                else if d.unit is "hours"
                  hourArc(d)
            )
            .attr("class", "clockhand")
            .attr("stroke", "black")
            .attr("stroke-width",(d)->
                if d.unit is "seconds"
                    2
                else if d.unit is "minutes"
                    3
                else if d.unit is "hours"
                    3
            )
            .attr("fill", "none")


    setInterval =>
      render(@time())
    , 1000
