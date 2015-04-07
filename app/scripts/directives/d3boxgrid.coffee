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
    		$http.get 'data/3429339.json'
  				.success (data) ->
  					$scope.message = 'data loaded!'
  					$scope.data = data
    ]

boxGridPlot = (element, data, opts) ->
	cms = data.cms
	legend_data = data.legend
	cm_row_height = 25
	top_axis_height = 100
	legend_height = 100
	cm_name_width = 120
	field_area_width = 200
	field_area_margin = 30
	cm_area_height = cms.length * cm_row_height
	svg_height = cm_area_height + top_axis_height + legend_height
	svg_width = (field_area_width + field_area_margin) * legend_data.length + cm_name_width
	svg = d3.select(element[0])
			.append('svg')
			.attr 'height', svg_height
			.attr 'width', svg_width
	start_date = new Date(2014,8,1)
	end_date = new Date(2015,3,1)
	time_scales = []
	
	for i in [0..(legend_data.length-1)] by 1
		time_scales.push(d3.time.scale()
							.domain( [start_date, end_date] )
							.range([cm_name_width + (i * field_area_width + field_area_margin), ((i+1) * field_area_width) + cm_name_width]))

	#Set up colors
	center_color = 'white'
	dist_to_center_color = 0.001
	start_colors = ['#1b9e77','#d95f02','#7570b3','#e7298a'] #Color Brewer Dark2
	color_scales = []
	for i in [0..(legend_data.length-1)] by 1
		color_scales.push(chroma.scale([chroma.interpolate(center_color, start_colors[i], dist_to_center_color), start_colors[i]]).mode('lch'))
	
	#Add legend boxes
	level_count = 7
	legend_spacing = field_area_width / level_count
	legend_item_start = legend_spacing / 2
	legend_data = data['legend']
	legend_groups = svg.selectAll '.legend'
						.data legend_data
						.enter()
						.append 'g'
						.attr 'class', 'legend'
						.attr 'transform', (d, i) ->
							 'translate(' + ( cm_name_width + (i * field_area_width + field_area_margin) ) + ',0)'
	legend_groups.append 'text'
				.text (d)->
					d.field_label
				.attr 'y', legend_height
				.attr 'x', field_area_width / 2
				.style 'text-anchor', 'middle'
				.each (d, i)->
					d.index = i

	legend_items = legend_groups.selectAll '.legend_level'
								.data (d) ->
									d.levels
								.enter()
								.append 'g'
								.attr 'class', 'legend_level'
								.attr 'transform', (d,i) ->
									'translate(' + (i * legend_spacing + legend_item_start) + "," + (legend_height - 30) + ')'
								.each (d)->
									d.leg_num = d3.select(this.parentNode).datum().index
								
	legend_items.append 'rect'
					.attr 'height', 10
					.attr 'width', 10
					.style 'fill', (d, i) ->
						p_i = d3.select(this.parentNode).datum().leg_num
						color_scales[p_i](d.level_value)
	legend_items.append 'text'
					.text (d) ->
						d.field_value
					.style 'text-anchor', 'start'
					.attr 'transform', 'rotate(-45)'
					.attr 'dx', '0.5em'
					.attr 'dy', '-.1em'


	#Add axis
	for time_scale in time_scales
		x_axis = d3.svg.axis()
						.scale(time_scale)
						.orient('top')
		d3.select 'svg' 
			.append 'g' 
			.attr 'class', 'x axis'
			.attr 'transform', () ->
				'translate(0,' + ((top_axis_height * 0.75) + legend_height) + ')'
			.call(x_axis)
			.selectAll 'text'
			.style 'text-anchor', 'start'
			.attr 'dx', '.5em'
			.attr 'dy', '.5em'
			.attr 'transform', 'rotate(-45)'

	#Add rows
	cm_rows = svg.selectAll '.cm_row'
		.data cms, (cm) ->
			cm.person_id
		.enter()
		.append 'g'
		.attr('class','cm_row')
		.attr "transform", (d,i) ->
			"translate(0," + (i * cm_row_height + top_axis_height + legend_height) + ")"
		
	#Add CM name to row
	cm_rows.append 'text'
		.text (d) ->
			d.cm_full_name
		.attr('alignment-baseline', 'hanging')

	field_samples = cm_rows.selectAll('.field_samples')
							.data (d)->
								d.fields
							.enter()
							.append 'g'
							.attr 'class', 'field_samples'
							.each (d,i)->
								d.index = i

	#Add boxes
	field_samples.selectAll('rect')
					.data (d) ->
						d.samples
					.enter()
					.append 'rect'
					.attr 'height', 5
					.attr 'width', 5
					.attr 'x', (d, i) ->
						p_i = d3.select(this.parentNode).datum().index
						time_scales[p_i]( new Date(d.iso_date))
					.attr 'y', 2.5
					.style 'fill', (d, i) ->
						p_i = d3.select(this.parentNode).datum().index
						color_scales[p_i](d.level_value)