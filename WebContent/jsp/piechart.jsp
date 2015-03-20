<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Pie Chart Example - HTML5 jQuery Chart Plugin by jqplot</title>



<script src="../himesh/js/jquery-1.11.0.js" type="text/javascript"></script> 
<link rel="stylesheet" type="text/css"
	href="../himesh/piechart/jquery.jqplot.css" />
<script src="../himesh/piechart/jquery.jqplot.js" type="text/javascript"></script>
<script type="text/javascript"
	src="../himesh/piechart/plugins/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript"
	src="../himesh/piechart/plugins/jqplot.donutRenderer.min.js"></script>
	

	
<script type="text/javascript" language="javascript" src="/RmgAllocation/himesh/js/jquery.dataTables.min.js"></script>	
<script lang="javascript" type="text/javascript">
	$(document).ready(function() {

		$.ajax({
			// have to use synchronous here, else the function 
			// will return before the data is fetched
 			async : false,
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
							datalabel : 'value',
							showDataLabels : true,
							highlightMouseDown : true
						}
					},
					legend : {
						show : true,
						location : 'e'
					}

				});
			}
		});

		$('#chart1').hover(function(){
			$(this).css('cursor','pointer');
		});
		$('#chart1').bind('jqplotDataClick',function (ev, seriesIndex, pointIndex, data) {
		      console.log("ev = " + ev + " seriesIndex = " + seriesIndex + "pointIndex = " + pointIndex + "data = " + data);
		      console.log(data);
		      console.log(data[0]);
		      $('#project_filter_table tfoot th').eq(4).find('select').each(function(){
		    	  console.log(this);
		    	  console.log(data[0]);
		    	  $(this).val(data[0]);	
		      });
		      $("#products_table_filter").find('input').val(data[0]);
		      
		   		  
		});
		
	});
</script>

</head>
<body>
	<div id="chart1"
		style="height: 300px; width: 500px; position: relative;"
		class="jqplot-target"></div>

</body>
</html>