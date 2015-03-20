$(document).ready(function(){
	
	/* Retrieve and display all the Projects in the Organization .
	 * On Projects click send an ajax get request to the corresponding web service
	 * and populate the datatable
	 */ 
	
	
   	var myFunction = function() {
	 	   // Project Search 
   		console.log('repeat');
   		
		var search_box = $('#products_table_filter').find('input');
		var search = $('#products_table_filter').find('input').val();
		console.log(search);
		if(search){
			table.column(4).search(search).draw();
		}   	
		   		
		   		
	   		
		   	
	   	};
	   setInterval(myFunction, 1000); // call every 1000 milliseconds

	var table =$('#products_table').DataTable({
			
			retrieve: true,
			"ajax": "/RmgAllocation/rmg/getProjects",
			"columns": [
			            { "data": "p_id" },
			            { "data": "p_name" },
			            { "data": "tech" },
			            { "data": "domain_id" }, 
			            { "data": "location_id" },
			            { "data": "branch_id" },
			            ],			
						"iDisplayLength": 5,
						"aLengthMenu" : [[-1,5,10,15,25,50],["All",5,10,15,25,50]],
						"fnInitComplete": function (oSettings, json){
							$("#project_filter_table tfoot th").each( function ( i ) {
					   	        var select = $('<select><option value="" default selected>---select---</option></select>')
					   	            .appendTo( $(this).empty() )
					   	            .on( 'change', function () {
					   	                var val = $(this).val();
					   	 
					   	             table.column( i )
					   	                    .search( val ? '^'+$(this).val()+'$' : val, true, false )
					   	                    .columns.adjust()
					   	                    .draw();
					   	            } );
					   	 
					   	     table.column( i ).data().unique().sort().each( function ( d, j ) {
					   	            select.append( '<option value="'+d+'">'+d+'</option>' );
					   	        } );
					   	        
					   	    } );
							

						}
		});

	
		
		$("#products_table_filter").find('input').attr('placeholder',"Project search");
		$("#chart").load("piechart.jsp ");
		

	   	
		$('#Employees').on('click', function() {
			
			window.location.href='EmployeeRmg.jsp';
		});
		$('#allocate').on('click', function() {
			
			window.location.href='AllocateRmg.jsp';
		});
	



});