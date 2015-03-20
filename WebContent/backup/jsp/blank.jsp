<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.dao.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>RMG</title>


<!-- Bootstrap Core CSS -->
<link href="/RmgAllocation/himesh/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="/RmgAllocation/himesh/css/plugins/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link href="/RmgAllocation/himesh/css/plugins/dataTables.bootstrap.css"
	rel="stylesheet">


<!-- Custom CSS -->
<link href="/RmgAllocation/himesh/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="/RmgAllocation/himesh/font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<!-- jquery-ui.css -->
<!-- <link rel="stylesheet" -->
<!-- 	href="http://code.jquery.com/ui/1.10.3/themes/blitzer/jquery-ui.css" -->
<!-- 	type="text/css" /> -->
	
<!--  Popbox.css -->
	<link rel='stylesheet' href='/RmgAllocation/himesh/css/popbox.css' type='text/css' media='screen' charset='utf-8'>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
/* .box { 
 	display: none; 
 	position: absolute; 
 	top: 30px; 
 	left: 10px; 
	background: #ffc; 
 	padding: 5px; 
 	border: 1px solid black; 
 } */
 
/*    .box { */
/*       display:block; */
/*       display:none; */
/*       background:#FFF; */
/*       border:solid 1px #BBBBBB; */
/*       border-radius:5px; */
/*       box-shadow:0px 0px 15px #999; */
/*       position:absolute;  */
/*       z-index:2; */
/*     } */
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

<script type="text/javaScript">
	function disableBackButton() {
		window.history.forward();
	}
	setTimeout("disableBackButton()", 0);
</script>

</head>

<body onload="disableBackButton()" >

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"	style="margin-bottom:0px;background:rgba(140, 20, 0, 0.85)">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"	data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>


				<a class="navbar-brand" href="/RmgAllocation/jsp/Homenew.jsp"   style="background:rgba(140, 20, 0, 0.85);color:#fff">Home</a>




		</div>
		<!-- /.navbar-header -->


		<a class="nav navbar-top-links navbar-right navbar-brand" href="/RmgAllocation/LoginHandler?user=logout" style="background:rgba(140, 20, 0, 0.85);color:#fff">Logout</a>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation" style="margin-bottom:0px;background-color:">
			<div class="sidebar-nav navbar-collapse"  >
				<ul class="nav" id="side-menu">
					<li  style="background:rgba(140, 20, 0, 0.85)"><a style="color:#fff" href="/RmgAllocation/jsp/blank.jsp"><i
							class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
					<li  style="background:rgba(140, 20, 0, 0.85)"><a style="color:#fff" href="#"><i class="fa fa-sitemap fa-fw"></i>
							Details <span class="caret"></span></a>
							
						<ul class="nav nav-second-level">
							<li  style="background:rgba(140, 20, 0, 0.85)"><a style="color:#fff" href="#" id="Employees">Employees</a></li>
							<li  style="background:rgba(140, 20, 0, 0.85)"><a style="color:#fff" href="#" id="Products">Projects</a></li>
						</ul> <!-- /.nav-second-level -->
					</li>
					<li  style="background:rgba(140, 20, 0, 0.85)"><a style="color:#fff" href="#" id="allocate"><i
							class="fa fa-wrench fa-fw"></i> Allocate</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Resource Allocation</h1>

				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row" style="display: none">
			<div class="panel-body" >
					<button type="button" id="filter_btn" class="btn btn-primary btn-lg" style="float:right">Additional filtering options</button>
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
						<div class="panel-heading">Employee List</div>
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
			
			<!-- /.row -->
			<div class="row" style="display: none">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Projects List</div>
						<!-- /.panel-heading -->

						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="products_table">
									<thead>
										<tr>
											<th>Project Id</th>
											<th>Project Name</th>
											<th>Technology</th>
											<th>Domain</th>
											<th>Location</th>
											<th>Branch</th>
										</tr>
									</thead>
									<tbody>
										<!-- My Data Table  -->
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
			<div class="row" style="display: none">
				<div class="col-lg-12">
					<!-- Progress Bar -->
					<div class="progress">
						<div
							class="progress-bar progress-bar-success progress-bar-striped active"
							role="progressbar" aria-valuenow="45" aria-valuemin="0"
							aria-valuemax="100" style="width: 0%">
							<span class="sr-only"></span>
						</div>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row" style="display: none">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3>Allocation Details </h3>
							<p>Please click on any cell to allocate projects.</p>
							<div class="table-responsive">

								<table class="table table-bordered table-striped"
									id="allocate_grid">
									<thead>
										<tr>
											<th></th>
											<th>Role1</th>
											<th>Role2</th>
											<th>Role3</th>
											<th>Role4</th>
											<th>Role5</th>
											<th>Role6</th>
											<th>Role7</th>
											<th>Role8</th>
											<th>Role9</th>
											<th>Role10</th>


										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>


							</div>
							<p>
							<div class="box">
									<table>
									</table>
								</div>
							
								<!-- Add text here -->
							</p>
						</div>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row" style="display: none">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Employee List</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">

								<table class="table table-striped table-bordered table-hover"
									id="empselect_table">
									<thead>
										<tr>

											<th>Employee Id</th>
											<th>Employee Name</th>
											<th>Email Id</th>
											<th>DOJ</th>
											<th>Technology</th>
											<th>Role Id</th>
											<th>Domain</th>
											<th>Last Unallocated</th>
											<th>Status</th>
											<th>Project ID</th>
											<th>Request Date</th>
											<th>Requests(count)</th>
											<th>Location</th>
										</tr>
									</thead>
									<tbody>
										<!-- My Data Table  -->
									</tbody>
								</table>

							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
				<center>
					<button id="button" class="btn btn-info" align="center">Add
						Selected</button>
				</center>
				<form id="ajaxform" action="RmgHandler" method="post">

					<input type="hidden" name="emp_ids" /> <input type="hidden"
						name="emp_names" /> <input type="hidden" name="roleid" /> <input
						type="hidden" name="pid" />

					<!-- Button trigger modal -->
					<center>
						<button type="submit" name="submit" class="btn btn-primary btn-lg"
							data-toggle="modal" data-target="#myModal">Send Request</button>
					</center>
				</form>
			</div>
			<!-- /.row -->

			<div class="row" style="display: none">
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Allocation
									Details</h4>
							</div>
							<div class="modal-body">
								<table id="ajaxResponse">
									<tbody></tbody>
								</table>
							</div>
							<div class="modal-footer">
								<a href="/RmgAllocation/jsp/blank.jsp">
									<button id="close" type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->




		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<script id="grid_tempy" type="tuts/template">
<tr>
<th>{{p_id}}</th>
<td>{{role1}}</td>
<td>{{role2}}</td>
<td>{{role3}}</td>
<td>{{role4}}</td>
<td>{{role5}}</td>
<td>{{role6}}</td>
<td>{{role7}}</td>
<td>{{role8}}</td>
<td>{{role9}}</td>
<td>{{role10}}</td>

</tr>
</script>

	<script id="employee_tempy" type="tuts/template">
<tr>

<td>{{emp_id}}</td>
<td>{{emp_name}}</td>
<td>{{email_id}}</td>
<td>{{doj}}</td>
<td>{{tech}}</td>
<td>{{role_id}}</td>
<td>{{domain_id}}</td>
<td>{{last_unalocated}}</td>
<td>{{status}}</td>
<td>{{p_id}}</td> 
<td>{{req_date}}</td>
<td>{{no_of_req}}</td>
<td>{{location_id}}</td>
</tr>
</script>
<script id="employee_tempy_popup" type="tuts/template">
<tr>

<td>Employee Id </td><td>:</td><td>{{emp_id}}</td></tr>
<tr><td>Employee Name </td><td>:</td><td>{{emp_name}}</td></tr>
<tr><td>Email</td><td> :</td><td>{{email_id}}</td></tr>
<tr><td>DOJ </td><td>:</td><td>{{doj}}</td></tr>

<tr><td>Domain </td><td>:</td><td>{{domain_id}}</td></tr>

<tr><td>Project</td><td> :</td><td>{{p_id}}</td> </tr>


</script>
<script id="project_tempy_popup" type="tuts/template">
<tr>

<td>project Id </td><td>:</td><td>{{p_id}}</td></tr>
<tr><td>Project Name </td><td>:</td><td>{{p_name}}</td></tr>
<tr><td>Domain</td><td> :</td><td>{{domain_id}}</td></tr>
<tr><td>Technology </td><td>:</td><td>{{tech}}</td></tr>

<tr><td>Location </td><td>:</td><td>{{location_id}}</td></tr>

<tr><td>Branch</td><td> :</td><td>{{branch_id}}</td> </tr>


</script>

	<!-- jQuery Version 1.11.0 -->
	<script src="/RmgAllocation/himesh/js/jquery-1.11.0.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/RmgAllocation/himesh/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="/RmgAllocation/himesh/js/plugins/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="/RmgAllocation/himesh/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script
		src="/RmgAllocation/himesh/js/plugins/dataTables/dataTables.bootstrap.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="/RmgAllocation/himesh/js/sb-admin-2.js"></script>

	<!-- bootbox.js -->
	<script src="/RmgAllocation/himesh/js/bootbox.js"></script>

	<!-- rmg.js -->
	<script src="/RmgAllocation/himesh/js/rmg.js"></script>

	<!-- jquery-ui.js -->
<!-- 	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> -->
	
	<!--  popbox.js -->
	<script type='text/javascript' charset='utf-8' src='/RmgAllocation/himesh/js/popbox.js'></script>


</body>
</html>