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
	
		<!--  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>  -->
	<script src="/RmgAllocation/js/jquery-1.11.1.js"></script>
	<script src="/RmgAllocation/themes/js/jquery-1.8.3.min.js"></script>

	<script type="text/javascript" language="javascript" src="/RmgAllocation/himesh/js/plugins/dataTables/jquery.js"></script>
	<script type="text/javascript" language="javascript" src="/RmgAllocation/himesh/js/jquery.dataTables.min.js"></script>	
	<script type="text/javascript" language="javascript" src="/RmgAllocation/himesh/js/plugins/dataTables/dataTables.tableTools.js"></script>
	<script type="text/javascript" language="javascript" src="/RmgAllocation/himesh/js/dataTables.jqueryui.js"></script>	
	


<!-- DataTables CSS -->
<link href="/RmgAllocation/himesh/css/plugins/dataTables.bootstrap.css"	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/RmgAllocation/himesh/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/RmgAllocation/himesh/css/dataTables.jqueryui.css">
<!-- <link href="/RmgAllocation/himesh/css/dataTables.tableTools.css"	rel="stylesheet"> -->

<!-- jqplot -->

<link rel="stylesheet" type="text/css" href="../himesh/piechart/jquery.jqplot.css" />


<!-- 		<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script> -->
<!-- rmg.js -->
	<script src="/RmgAllocation/himesh/js/projects_rmg.js"></script>
<script>
$(document).ready(function() {
	
	
	
	/*	Main Page Routing */
	$('#profile').on('click', function() {
		var url = '/RmgAllocation/jsp/Viewemployee_lokesh.jsp';
		$(location).attr('href', url);
		//$('#populate').load("/RmgAllocation/jsp/Employee_list.jsp");

		
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
		
		<h1 id="pageTitle">Resource Management Application </h1>
		<ul align="center" style="color:black">
								<li class="btn " id="Employees">Employees List</li>
								<li class="btn " id="Products">Projects List</li>
								<li class="btn " id="allocate">Allocate </li>
		</ul>
	</div>
</section> 
<!-- Page banner end -->
<section id="bodySection">
<div class="container">					
<!-- Page Content -->
		<!-- /.row -->
				<!-- /.col-lg-6 -->
			
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">

				<center><div id="chart" ></div></center>
					<div class="panel panel-default">
					<table id="project_filter_table" style="display:none" >
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
						<tfoot>
						<tr>
											<th>Project Id</th>
											<th>Project Name</th>
											<th>Technology</th>
											<th>Domain</th>
											<th>Location</th>
											<th>Branch</th>
						</tr>
		
						</tfoot>

					</table>
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
			<!-- /.row -->
			<!-- /.row -->
			<!-- /.row -->
			<!-- /.row -->




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
<!--     <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script> -->
	<script src="/RmgAllocation/themes/js/bootstrap.min.js"></script>
	<script src="/RmgAllocation/themes/js/bootstrap-tooltip.js"></script>
    <script src="/RmgAllocation/themes/js/bootstrap-popover.js"></script>
	<script src="/RmgAllocation/themes/js/business_ltd_1.0.js"></script>
		<!-- bootbox.js -->
	<script src="/RmgAllocation/himesh/js/bootbox.js"></script>
	
	
	
 
<!-- Themes switcher section ============================================================================================= -->


</body>
</html>