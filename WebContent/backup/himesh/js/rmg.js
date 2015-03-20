

$(document).ready(function() {
	
	var heading		= $('.container').children('.row').eq(0); // heading
	var employees = $('.container').children('.row').eq(1);   // details of all employees divison
	var projects = $('.container').children('.row').eq(2);	// details of all projects divisoion
	var bar 	= $('.container').children('.row').eq(3);	// Progress Bar
	var allocate = $('.container').children('.row').eq(4);	// Allocate grid division
	var select = $('.container').children('.row').eq(5);		// the selected employes table division
	var response = $('.container').children('.row').eq(6);	//the response from the servlet
	

	/*Progress Bar*/
	var progress = bar.find('.progress-bar');
	
		/*Cursor effect*/
	$('#allocate_grid,#empselect_table').hover(function(){
		$(this).css('cursor','pointer');
	});
	


	$("#products_table_filter").find('input').attr('placeholder',"Project search");
	
	$('.disclaimer').popover(
			  {
			     trigger: 'hover',
			     html: true,
			     placement: 'bottom',
			     content: 'You are not authorized to access this page'
			  });


	/* Retrieve and display all the Projects in the Organization .
	 * On Projects click send an ajax get request to the corresponding web service
	 * and populate the datatable
	 */ 
	$('#Products').on('click', function() {
		$('.container').children('.row').hide(); // hide all
		

		$('#products_table').DataTable({
			
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
						"aLengthMenu" : [[-1,5,10,15,25,50],["All",5,10,15,25,50]]	
		});


		projects.fadeIn('slow');
		$("#products_table_filter").find('input').attr('placeholder',"Project search");
		
				
			});

	/* Retrieve and display all the Employees in the Organization .
	 * On Employees click send an ajax get request to the corresponding web service
	 * and populate the datatable
	 */ 
			
$('#Employees').on('click', function() {
	$('.container').children('.row').hide(); // hide all
	

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
   		/* Status and Location filter */
		
   		
   		

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
   		/* End of  Status and Location filter */

   		$("#other_table").show();
//   	});
   	// end of advance search filter1
   	

	employees.fadeIn('slow');


    
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
			
	});


/* Retrieve and display  the Requirement grid in the Organization .
 * On click send an ajax get request to the corresponding web service
 * and populate the datatable
 */ 
$('#allocate').on('click',function(){
	$('.container').children('.row').hide(); // hide all
	

	$.ajax(
			{
				url :"/RmgAllocation/rmg/grid" ,
				contentType: 'application/json',
				
				success:function(data, textStatus, jqXHR) 
				{
					console.log(data);
					console.log("success");
					template = $('#grid_tempy').html();
					var s = $('#allocate_grid').find('tbody').html('');
					console.log("populating grid");
					$.each(data,function(index,obj){
						console.log('loop');
						var temp = template.replace(/{{p_id}}/ig, obj.p_id)
						.replace(/{{role1}}/ig,obj.role1)
						.replace(/{{role2}}/ig,obj.role2)
						.replace(/{{role3}}/ig,obj.role3)
						.replace(/{{role4}}/ig,obj.role4)
						.replace(/{{role5}}/ig,obj.role5)
						.replace(/{{role6}}/ig,obj.role6)
						.replace(/{{role7}}/ig,obj.role7)
						.replace(/{{role8}}/ig,obj.role8)
						.replace(/{{role9}}/ig,obj.role9)
						.replace(/{{role10}}/ig,obj.role10);
						s.append(temp);
					});
				},
				error: function(jqXHR, textStatus, errorThrown) 
				{
					alert("error: "+jqXHR+" status: "+textStatus+" er:"+errorThrown);
				}
			});
	allocate.fadeIn('slow');
	//bar.show();
	//progress.css('width','0%');
	
	/*Projects PopUp*/
	$('#allocate_grid tbody').on('mouseleave','tr th',function(){
		console.log("on mouseleave");
		$(".box").css('display','none');
	});
	$('#allocate_grid tbody').on('mouseenter','tr th',function(){
		$(this).on('mousemove',function(e){
			console.log("on mouseover");
		var id = $(this).closest('tr').children().eq(0).text();console.log(id);
		$.ajax({
			url : '/RmgAllocation/rmg/getProjects/project/'+id,
			type: "GET",
			
			datatype : 'json',
			
			success:function(data, textStatus, jqXHR) 
			{
				console.log('success project/'+id);
				
				template = $('#project_tempy_popup').html();
				var s = $('.box').find('table').html('');
				console.log("populating new popup");
				$.each(data,function(index,obj){
					console.log('loop');
					var temp = template.replace(/{{p_id}}/ig, obj.p_id)
										.replace(/{{p_name}}/ig, obj.p_name)
										.replace(/{{domain_id}}/ig, obj.domain_id)
										.replace(/{{tech}}/ig, obj.tech)
										.replace(/{{location_id}}/ig, obj.location_id)
										.replace(/{{branch_id}}/ig, obj.branch_id);
										
										
										s.append(temp);
				});
				var mousex = e.pageX-60 ; //Get X coordinates
		        var mousey = e.pageY-170 ; //Get Y coordinates
				$(".box").css({ 'display':'block','top': mousey, 'left': mousex});
//
				
//				response.fadeIn("slow");
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
				// if fails
			}
			
		});
		});
	});


});


/* Retrieve and display all the Employees whose role has been selected in the Requirement grid in the Organization .
 * On click ask for confirmation and send an ajax request to the corresponding Employees web service
 * and populate the datatable .
 * Filter the Data According to the Requirement
 */ 
	$("#allocate_grid").on('click','td',function(){
		
		/* allocate and bar are visible here */
		var roleid = $(this).closest('table').find('th').eq($(this).index()).text(); // get the role
		var $td = $(this).text(); // get the count
		/* check if its fulfilled */
		if($td=="0"){
			// if yes display an alert and hide the grid & progress bar(quit)
			alert("The Requirement for this role("+roleid+") has already been fulfilled");
			allocate.hide();
			//progress.hide();
		}
		else{
			var roleid = $(this).closest('table').find('th').eq($(this).index()).text(); // get the role
			var pid = $(this).parent('tr').children('th').eq(0).text(); // get the project id
			var msg = "Click OK to allocate - "+ $td +" - resources of -"+roleid+"- to Project - "+pid+""; // Proceed message
			var emp_ids =[];   // variable for storing the selected emp_ids 
			var emp_names=[];	// variable for storing the selected emp_names
			bootbox.confirm(msg, function(result) {
				if(result){
								$("#sel_role").html(roleid);
			//					projects.hide();
								allocate.hide();
			//					employees.hide();
			//					response.hide();
			//					redirect.hide();
								$("#ajaxform").find("button[name='submit']").hide();  //hiding the send request button
								//progress.css('width','50%');
			
								var table = $('#empselect_table').DataTable({
									retrieve: true,
									"autoWidth": true,
									 dom: 'T<"clear">lfrtip',
								        tableTools: {
								            "sRowSelect": "multi",
								            "aButtons": [
								                       {
								                           sExtends: 'select_all',
								                           //sButtonText: 'Select All',
								                           fnClick: function (nButton, oConfig, oFlash) {
								                               TableTools.fnGetInstance('empselect_table').fnSelectAll(true);
								                           }
								                       },
								                       {
								                           sExtends: 'select_none',
								                           //sButtonText: 'Deselect All',
								                           fnClick: function (nButton, oConfig, oFlash) {
								                               TableTools.fnGetInstance('empselect_table').fnSelectNone (true);
								                           }
								                       }
								                   ],
								          
								           // "aButtons": [ "select_all", "select_none" ],
								            "sSelectedClass": "active"
								        },
									
									"ajax": "/RmgAllocation/rmg/getEmployees/rolefilter/"+roleid,
			
									"columns": [
									            { "data": "emp_id" },
									            { "data": "emp_name" },
			//						            { "data": "email_id" },
			//						            { "data": "doj" },
									            { "data": "tech" },    
			//						            { "data": "role_id" },
									            { "data": "domain_id" },
			//						            { "data": "last_unallocated" },
									            { "data": "status" },
									            { "data": "p_id" },
			//						            { "data": "req_date" },
									            { "data": "no_of_req" },
									            { "data": "location_id" },
									            ],
												"iDisplayLength": 5,
												"aLengthMenu" : [[-1,5,10,15,25,50],["All",5,10,15,25,50]],
									"fnInitComplete": function (oSettings, json){
										$("#other_table2 tfoot th").each( function ( i ) {
								   	        var select = $('<select><option value=""></option></select>')
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
								}).columns.adjust().draw();//.column(5).search( roleid ).draw(); //filtering based on roleid
			
			
							   	// advanced search filter 2
//							   	$("#filter_btn2").click(function(){
							   		// Change color of the filter button
			
							   		//$(this).attr('class',$(this).attr('class') == 'btn btn-primary btn-lg' ? 'btn btn-danger btn-lg' : 'btn btn-primary btn-lg');
							  		
							   		//changed
							   		/* Status and Location filter */
							   		
							   		
			
							   		$("#other_table2").find('thead').find('tr').children().eq(0).hide();
							   		$("#other_table2").find('thead').find('tr').children().eq(1).hide();
							   		
							   		$("#other_table2").find('thead').find('tr').children().eq(6).hide();
							   		$("#other_table2").find('thead').find('tr').children().eq(5).hide();
							   		
							   		$("#other_table2").find('tfoot').find('tr').children().eq(0).hide();
							   		$("#other_table2").find('tfoot').find('tr').children().eq(1).hide();
							   		
							   		$("#other_table2").find('tfoot').find('tr').children().eq(6).hide();
							   		$("#other_table2").find('tfoot').find('tr').children().eq(5).hide();
							   		/* End of  Status and Location filter */
			
							   		$("#other_table2").fadeToggle('slow');
//							   	});
							   	// end of advance search filter2
								
								$('#empselect_table tbody').on( 'click', 'tr', function () {
									$(this).toggleClass('active');
								} );
			
								/* Employee Pop up */
								$('#empselect_table tbody').on('mouseleave','tr td:first-child',function(){
									console.log("on mouseleave");
									$(".box").css('display','none');
								});
								$('#empselect_table tbody').on('mouseenter','tr td:first-child',function(){
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
			//								response.fadeIn("slow");
										},
										error: function(jqXHR, textStatus, errorThrown) 
										{
											// if fails
										}
									});	
									});
								});
			
			
			
								$('#button').click( function () {
									var rows = table.rows('.active').data();
									for(var i=0;i<rows.length;i++){
										emp_ids.push(rows[i].emp_id);
										emp_names.push(rows[i].emp_name);
									}
			
									console.log(emp_ids);
									console.log(emp_names);
									console.log(roleid);
									console.log(pid);
									$("input[name='emp_ids']").val(emp_ids);
									$("input[name='emp_names']").val(emp_names);
									$("input[name='roleid']").val(roleid);
									$("input[name='pid']").val(pid);
							
									emp_ids = [];
									emp_names=[];
									$("#send_request").show();
									//progress.css('width','100%');
			
			
								} );
								
								$(".DTTT_container").insertAfter("#other_table2");
								
								
								select.fadeIn('slow');
								$("#empselect_table_filter").find('input').attr('placeholder',"Employee search");
			


				}
			}); 
		}
	});

	$('#ajaxform').on('submit',function(e){
		console.log('on send Request');
		$('.container').children('.row').hide(); // hide all

		var postData = $(this).serializeArray();
		var formURL = "/RmgAllocation/RmgHandler";
		$.ajax(
				{
					url : formURL,
					type: "POST",
					data : postData,
					datatype : 'json',
					
					success:function(data, textStatus, jqXHR) 
					{
						console.log('success');
						
						var s = $("#ajaxResponse").find('tbody');
						s.html('');
						$.each(data, function(key, value){
							
							s.append("<tr><th>"+key+"</th><td>"+value+"</td></tr>");
							

						});
						
						response.fadeIn("slow");
					},
					error: function(jqXHR, textStatus, errorThrown) 
					{
						// if fails
					}
				});
						e.preventDefault(); // STOP default action
//						e.unbind(); // unbind. to stop multiple form

		
	});
//document.ready()
	

	$('#close').on('click', function() {
		var url = '/RmgAllocation/jsp/NewRmg.jsp';
		$(location).attr('href', url);
	});
	

});




 

