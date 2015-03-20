$(document).ready(function() {

		$.ajax({
			// have to use synchronous here, else the function 
			// will return before the data is fetched
// 			async : false,
			url : '/RmgAllocation/rmg/getEmployees/populatePieChart',
			dataType : "json",
			success : function(data) {
				var ret = [];
				$.each(data, function(key, obj) {
					var info = [ obj.location_id, obj.count ];
					console.log(info);
					ret.push(info);
				});
				console.log(ret);
				$.jqplot('chart1', eval([ret]), {
					title : 'Location Chart',
					seriesDefaults : {
						// Make this a pie chart.
						renderer : jQuery.jqplot.PieRenderer,
						rendererOptions : {
							// Put data labels on the pie slices.
							// By default, labels show the percentage of the slice.
						
							showDataLabels : true
						}
					},
					legend : {
						show : true,
						location : 'e'
					}

				});
			}
		});

	});