<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"
	import="com.bean.Employee" import="com.dao.EmployeeDAO"
	import="com.bean.Project" import="com.bean.Request"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	<link id="callCss" rel="stylesheet" href="/RmgAllocation/themes/current/bootstrap.min.css" type="text/css" media="screen"/>
	<link href="/RmgAllocation/themes/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css">
	<link href="/RmgAllocation/themes/css/font-awesome.css" rel="stylesheet" type="text/css">
	<link href="/RmgAllocation/themes/css/base.css" rel="stylesheet" type="text/css">
	<style type="text/css" id="enject"></style>
	


 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<script src="/RmgAllocation/themes/js/jquery-1.8.3.min.js"></script>

<script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="//cdn.datatables.net/plug-ins/a5734b29083/integration/jqueryui/dataTables.jqueryui.js"></script>	
<!-- DataTables CSS -->
<link href="/RmgAllocation/himesh/css/plugins/dataTables.bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/a5734b29083/integration/jqueryui/dataTables.jqueryui.css">


<!-- 		<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script> -->

<script>
$(document).ready(function() {
	
	
	
	/*	Main Page Routing */
	$('#profile').on('click', function() {
		var url = '/RmgAllocation/jsp/Viewemployee_lokesh.jsp';
		$(location).attr('href', url);
		//$('#populate').load("/RmgAllocation/jsp/Employee_list.jsp");

		
	});
	
	
		
		

	   	var emp_table = $('#employees_table').DataTable({
			  
			 retrieve: true,
			    "ajax": "/RmgAllocation/rmg/getEmployees",
			    "columns": [
			                { "data": "emp_id" },
			                { "data": "emp_name" },
//			                { "data": "email_id" },
//			                { "data": "doj" },
			                { "data": "tech" },    
			                { "data": "role_id" },
//			                { "data": "domain_id" },
//			                { "data": "last_unallocated" },
			                { "data": "status" },
			                { "data": "p_id" },
//			                { "data": "req_date" },
//			                { "data": "no_of_req" },
			                { "data": "location_id" },
			            ],
				"iDisplayLength": 3,
			    "aLengthMenu": [[3,5, 10, 25, 50, -1], [3,5, 10, 25, 50, "All"]]		
			});
	   	
	   	$("#filter_btn").click(function(){
	   		// Change color of the filter button

	   		$(this).attr('class',$(this).attr('class') == 'btn btn-primary btn-lg' ? 'btn btn-danger btn-lg' : 'btn btn-primary btn-lg');
	  		
	   		//changed
	   		/* Status and Location filter */
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

	   		$("#other_table").fadeToggle('slow');
	   	});
	   	

		


	    
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
//					response.fadeIn("slow");
				},
				error: function(jqXHR, textStatus, errorThrown) 
				{
					// if fails
				}
			});	
			});
		});
				
		});


</script>
	<script  src="/RmgAllocation/js/homenew.js"></script>
</head>
<style>
.box {  
  	display: none;   
   	position: absolute;    
 /*   	top: 30px;    */ 
 /*   	left: 10px;    */ 
   	background: #ffc;  
  	padding: 5px;  
  	border: 0px solid black;  
 	z-index:10; 
 	box-shadow: 0px 0px 5px #888888;
 	background-color:white;
 }     
    
</style>
<body>
<%@include file="Header.jsp" %>
<!--Header Ends================================================ -->
<!-- Page banner -->
<section id="bannerSection" style="background:url(/RmgAllocation/themes/images/banner/blog.png) no-repeat center center #000;">
	<div class="container" >
	
	<% session = request.getSession(false);
int id1=(Integer)session.getAttribute("employeeid");
EmployeeDAO empdao12 = new EmployeeDAO();
Employee emp1 = empdao12.getEmployeeDetails(id1);

%>
		
<%-- 		<h1 id="pageTitle">Welcome <font face="verdena"> <%=emp1.getEmp_name()%></font></h1>  --%>
		
		<h1 id="pageTitle"> Available Employee Pool </h1>
		
	</div>
</section> 
<!-- Page banner end -->
<section id="bodySection">
<div class="container">					
<!-- Page Content -->
		
		<!-- /.row -->
			<div class="row">
			<div class="panel-body">
					<center><button type="button" id="filter_btn" class="btn btn-primary btn-lg" >Additional filtering options</button></center>
			</div>
			<div class="panel-body">
			
			</div>
			
				<div class="col-lg-12">
				

					<table id="other_table"  style="display: none;float:right">
						<thead>
							<tr>
								<th>Employee Id</th>
								<th>Employee Name</th>
								<!-- 												<th>Email Id</th> -->
								<!-- 												<th>DOJ</th> -->
								<th>Technology</th>
								<th>Role Id</th>
								<!-- 												<th>Domain</th> -->
								<!-- 												<th>Last Unallocated</th> -->
								<th>Status</th>
								<th>Project ID</th>
								<!-- 												<th>Request Date</th> -->
								<!-- 												<th>Requests(count)</th> -->
								<th>Location</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Employee Id</th>
								<th>Employee Name</th>
								<!-- 												<th>Email Id</th> -->
								<!-- 												<th>DOJ</th> -->
								<th>Technology</th>
								<th>Role Id</th>
								<!-- 												<th>Domain</th> -->
								<!-- 												<th>Last Unallocated</th> -->
								<th>Status</th>
								<th>Project ID</th>
								<!-- 												<th>Request Date</th> -->
								<!-- 												<th>Requests(count)</th> -->
								<th>Location</th>
							</tr>
						</tfoot>

					</table>

					<div class="panel panel-default">
						
						<!-- /.panel-heading -->



						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="employees_table">
									<thead>
										<tr>
											<th>Employee Id</th>
											<th>Employee Name</th>
											<!-- 												<th>Email Id</th> -->
											<!-- 												<th>DOJ</th> -->
											<th>Technology</th>
											<th>Role Id</th>
											<!-- 												<th>Domain</th> -->
											<!-- 												<th>Last Unallocated</th> -->
											<th>Status</th>
											<th>Project ID</th>
											<!-- 												<th>Request Date</th> -->
											<!-- 												<th>Requests(count)</th> -->
											<th>Location</th>
										</tr>
									</thead>
								
									<tbody>
										<!-- My Data Table  -->
									</tbody>
								</table>
								<div class='box'>
						
								<table></table>
								</div>							
							</div>

						</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
	



</div>


</section>
 <!-- Footer
  ================================================== -->
  <section id="bodySection">
	<div class="container">
		<div class="row">
			<h3 class="span12" style="text-align: center">What our website
				can do</h3>
			<div class="span4">
				<div class="thumbnail">
					<h4>Manager Portal</h4>
					<a href="#"><img src="/RmgAllocation/themes/images/1.jpg"
						alt="bootstrap business templates"></a>
					<p>
						<br /> A Manager can create a team and request for resources. 
						<br />
					</p>
					
				</div>
			</div>
			<div class="span4">
				<div class="thumbnail">
					<h4>Employee Portal</h4>
					<a href="#"><img src="/RmgAllocation/themes/images/2.jpg"
						alt="bootstrap business templates"></a>
					<p>
						<br /> An Employee can see his details, his status and a list of
						project requests if he is unallocated. <br />
					</p>
					
				</div>
			</div>
			<div class="span4">
				<div class="thumbnail">
					<h4>RMG Portal</h4>
					<a href="#"><img src="/RmgAllocation/themes/images/3.jpg"
						alt="bootstrap business templates"></a>
					<p>
						<br /> RMG can see Employee List, Project List and allocate
						resources to corresponding request. <br />
					</p>
					
				</div>
			</div>
		</div>
		<br />
	</div>
	</section>
<section id="footerSection">
<div class="container">
    <footer class="footer well well-small">
	
			<h4>Digital Marketing</h4>	
		
	</footer>
	</div>
</section>


<a href="#" class="btn" style="position: fixed; bottom: 38px; right: 10px; display: none; " id="toTop"> <i class="icon-arrow-up"></i> Go to top</a>
<!-- Javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script id="employee_tempy_popup" type="tuts/template">
<tr>

<td>Employee Id </td><td>:</td><td>{{emp_id}}</td></tr>
<tr><td>Employee Name </td><td>:</td><td>{{emp_name}}</td></tr>
<tr><td>Email</td><td> :</td><td>{{email_id}}</td></tr>
<tr><td>DOJ </td><td>:</td><td>{{doj}}</td></tr>

<tr><td>Domain </td><td>:</td><td>{{domain_id}}</td></tr>

<tr><td>Project</td><td> :</td><td>{{p_id}}</td> </tr>


</script>
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
	
	<script src="/RmgAllocation/themes/js/bootstrap.min.js"></script>
	<script src="/RmgAllocation/themes/js/bootstrap-tooltip.js"></script>
    <script src="/RmgAllocation/themes/js/bootstrap-popover.js"></script>
	<script src="/RmgAllocation/themes/js/business_ltd_1.0.js"></script>
		<!-- bootbox.js -->
	<script src="/RmgAllocation/himesh/js/bootbox.js"></script>
	<!-- rmg.js -->
	<script src="/RmgAllocation/himesh/rmg.js"></script>

 
<!-- Themes switcher section ============================================================================================= -->


</body>
</html>