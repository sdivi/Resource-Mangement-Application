$(document).ready(function(){
	
	

   	var emp_table = $('#employees_table').DataTable({
		  
		 retrieve: true,
		    "ajax": "/RmgAllocation/rmg/getEmployees",
		    "columns": [
		                { "data": "emp_id" },
		                { "data": "emp_name" },
//		                { "data": "email_id" },
//		                { "data": "doj" },
		                { "data": "tech" },    
		                { "data": "role_id" },
//		                { "data": "domain_id" },
//		                { "data": "last_unallocated" },
		                { "data": "status" },
		                { "data": "p_id" },
//		                { "data": "req_date" },
//		                { "data": "no_of_req" },
		                { "data": "location_id" },
		            ],
			"iDisplayLength": 5,
			"aLengthMenu" : [[-1,5,10,15,25,50],["All",5,10,15,25,50]],
//      	    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
			"fnInitComplete": function (oSettings, json) {
	            //alert('DataTables has finished its initialisation.');
				$("#other_table tfoot th").each( function ( i ) {
		   	        var select = $('<select><option value=""></option></select>')
		   	            .appendTo( $(this).empty() )
		   	            .on( 'change', function () {
		   	                var val = $(this).val();
		   	 
		   	             emp_table.column( i )
		   	                    .search( val ? '^'+$(this).val()+'$' : val, true, false )
		   	                    .draw();
		   	            } );
		   	 
		   	        emp_table.column( i ).data().unique().sort().each( function ( d, j ) {
		   	            select.append( '<option value="'+d+'">'+d+'</option>' );
		   	        } );
		   	        
		   	    } );
				
	        }
		});
   	// Employee Search 
   			var search_box = $('#employees_table_filter').find('input');
		   	search_box.on('keyup',function(){
		   		console.log('inside search box');
		   		var search = $('#employees_table_filter').find('input').val();
	   			console.log(search);
	   			emp_table.column(1).search(search).draw();
		   	});
   			
   	// advanced search filter 1
//   	$("#filter_btn").click(function(){
   		// Change color of the filter button

   		//$(this).attr('class',$(this).attr('class') == 'btn btn-lg' ? 'btn btn-danger btn-lg' : 'btn btn-lg');
  		
   		//changed
   		
		
   		
   		

   		$("#other_table").find('thead').find('tr').children().eq(0).hide();
   		$("#other_table").find('thead').find('tr').children().eq(1).hide();
   		$("#other_table").find('thead').find('tr').children().eq(2).hide();
   		$("#other_table").find('thead').find('tr').children().eq(3).hide();
   		$("#other_table").find('thead').find('tr').children().eq(5).hide();
   		
   		$("#other_table").find('tfoot').find('tr').children().eq(0).hide();
   		$("#other_table").find('tfoot').find('tr').children().eq(1).hide();
   		$("#other_table").find('tfoot').find('tr').children().eq(2).hide();
   		$("#other_table").find('tfoot').find('tr').children().eq(3).hide();
   		$("#other_table").find('tfoot').find('tr').children().eq(5).hide();
   	

   		$("#other_table").show();
//   	});
   	// end of advance search filter1
   	

	


    
	$("#employees_table_filter").find('input').attr('placeholder',"Employee search");
	
	
	$('#employees_table tbody').on('mouseleave','tr td:first-child',function(){
		console.log("on mouseleave");
		$(".box").css('display','none');
	});
	$('#employees_table tbody').on('mouseenter','tr td:first-child',function(){
		$(this).on('mousemove',function(e){
		console.log("on mouseover");
		var id = $(this).closest('tr').children().eq(0).text();console.log(id);
		$.ajax({
			url : '/RmgAllocation/rmg/getEmployees/employee/'+id,
			type: "GET",
			
			datatype : 'json',
			
			success:function(data, textStatus, jqXHR) 
			{
				console.log('success employee/'+id);
				
				template = $('#employee_tempy_popup').html();
				var s = $('.box').find('table').html('');
				console.log("populating popup");
				$.each(data,function(index,obj){
					console.log('loop');
					var temp = template.replace(/{{emp_id}}/ig, obj.emp_id)
										.replace(/{{emp_name}}/ig, obj.emp_name)
										.replace(/{{email_id}}/ig, obj.email_id)
										.replace(/{{doj}}/ig, obj.doj)
										.replace(/{{domain_id}}/ig, obj.domain_id)
										.replace(/{{p_id}}/ig, obj.p_id);
										
										
										s.append(temp);
				});
				var mousex = e.pageX-60 ; //Get X coordinates
		        var mousey = e.pageY-170 ; //Get Y coordinates
				$(".box").css({ 'display':'block','top': mousey, 'left': mousex});
//				response.fadeIn("slow");
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
				// if fails
			}
		});	
		});
	});
	$('#Products').on('click', function() {
		
		window.location.href='ProjectsRmg.jsp';
	});
	$('#allocate').on('click', function() {
		
		window.location.href='AllocateRmg.jsp';
	});

});