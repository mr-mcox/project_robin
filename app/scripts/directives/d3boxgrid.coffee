'use strict'

###*
 # @ngdoc directive
 # @name projectRobinApp.directive:d3BoxGrid
 # @description
 # # d3BoxGrid
###
angular.module 'projectRobinApp'
  .directive 'd3BoxGrid', ->
    restrict: 'EA'
    template: '<div></div>'
    link: (scope, element, attrs) ->
      scope.$watch 'data', (values) ->
      	if values
      		boxGridPlot(element, scope.data, attrs)
    controller: ['$scope', '$http', ($scope, $http) ->
    	$scope.getData = () ->
    		$http.get 'data/data.json'
  				.success (data) ->
  					$scope.message = 'data loaded!'
  					$scope.data = data
    ]

boxGridPlot = (element, data, opts) ->
	cms = data.cms
	cm_row_height = 25
	top_axis_height = 80
	legend_height = 0
	svg_height = cms.length * cm_row_height + top_axis_height + legend_height
	svg = d3.select(element[0])
			.append('svg')
			.attr 'height', svg_height
			.attr 'width', '100%'
	start_date = new Date(2014,8,1)
	end_date = new Date(2015,3,1)
	time_scale = d3.time.scale()
					.domain( [start_date, end_date] )
					.range([120, 300])
	center_color = '#ffffb3'
	dist_to_center_color = 0.001
	start_colors = ['#1b9e77','#d95f02','#7570b3','#e7298a'] #Color Brewer Dark2
	color_scale = chroma.scale([chroma.interpolate(center_color, start_colors[2], dist_to_center_color), start_colors[2]]).mode('lch')
	x_axis = d3.svg.axis().scale(time_scale).orient('top')
	d3.select 'svg' 
		.append 'g' 
		.attr 'class', 'x axis'
		.attr 'transform', () ->
			'translate(0,' + (top_axis_height * 0.75) + ')'
		.call(x_axis)
		.selectAll 'text'
		.style 'text-anchor', 'start'
		.attr 'dx', '.3em'
		.attr 'dy', '.3em'
		.attr 'transform', 'rotate(-45)'
	cm_rows = svg.selectAll '.cm_row'
		.data cms, (cm) ->
			cm.pid
		.enter()
		.append 'g'
		.attr('class','cm_row')
		.attr "transform", (d,i) ->
			"translate(0," + (i * cm_row_height + top_axis_height + legend_height) + ")"
		

	cm_rows.append 'text'
		.text (d) ->
			d.cm_name
		.attr('alignment-baseline', 'hanging')

	data_boxes = cm_rows.selectAll('rect')
					.data (d) ->
						d.fields[0].samples
					.enter()
					.append 'rect'
					.attr 'height', 5
					.attr 'width', 5
					.attr 'x', (d, i) ->
						time_scale( new Date(d.date))
					.attr 'y', 2.5
					.style 'fill', (d) ->
						color_scale(d.level_value)