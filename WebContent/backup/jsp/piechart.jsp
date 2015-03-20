<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>
    Pie Chart Example - HTML5 jQuery Chart Plugin by jqChart
</title>
    

	
<script src="../himesh/js/jquery-1.11.0.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../himesh/piechart/jquery.jqplot.css" />
<script src="../himesh/piechart/jquery.jqplot.js" type="text/javascript"></script>
<script type="text/javascript" src="../himesh/piechart/plugins/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript" src="../himesh/piechart/plugins/jqplot.donutRenderer.min.js"></script>
    
    <script lang="javascript" type="text/javascript">
    $(document).ready(function(){
    		
    	 // Our ajax data renderer which here retrieves a text file.
    	  // it could contact any source and pull data, however.
    	  // The options argument isn't used in this renderer.
//     	  var ajaxDataRenderer = function(url, plot, options) {
//     	    var ret = null;
//     	    $.ajax({
//     	      // have to use synchronous here, else the function 
//     	      // will return before the data is fetched
//     	      async: false,
//     	      url: url,
//     	      dataType:"json",
//     	      success: function(data) {
//     	        ret = data;
//     	      }
//     	    });
//     	    return ret;
//     	  };
    	  var data = [
    	    ['Heavy Industry', 12],['Retail', 9], ['Light Industry', 14], 
    	    ['Out of home', 16],['Commuting', 7], ['Orientation', 9]
    	  ];
// 		var jsonurl = '';
    	var plot1 = jQuery.jqplot ('chart1', [data], 
    	    { 
    	      seriesDefaults: {
    	        // Make this a pie chart.
    	        renderer: jQuery.jqplot.PieRenderer, 
    	        rendererOptions: {
    	          // Put data labels on the pie slices.
    	          // By default, labels show the percentage of the slice.
    	          showDataLabels: true
    	        }
    	      }, 
    	      legend: { show:true, location: 'e' },
//     	      dataRenderer: ajaxDataRenderer,
//     	      dataRendererOptions: {
//     	        unusedOptionalUrl: jsonurl
//     	      }
    	    }
    	  );
    	});
     </script>

</head>
<body>
	<div id="chart1"
		style="height: 300px; width: 500px; position: relative;"
		class="jqplot-target">

	</div>

</body>
</html>