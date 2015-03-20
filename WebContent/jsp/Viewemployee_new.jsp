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

<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/a5734b29083/integration/jqueryui/dataTables.jqueryui.css">

<script type="text/javascript" src="/RmgAllocation/js/View_Employee.js"></script>
<!-- 		<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script> -->

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
		
		<h1 id="pageTitle">Profile</h1>
		
	</div>
</section> 
<!-- Page banner end -->
<section id="bodySection">
<div class="container">					
<div class="row">						
<div class="span9">						
<div class="thumbnail"  style="width:800px">

<h4 align="left">&nbsp;&nbsp;&nbsp;Employee Details</h4>
 <%
			//int emp_id = 7;
		session=request.getSession(false);
		int emp_id=(Integer)session.getAttribute("employeeid");
		%>
		<%
			EmployeeDAO empdao = new EmployeeDAO();
			Employee e = new Employee();
			e = empdao.getEmployeeDetails(emp_id);
			Collection<Project> projects = empdao.getProjects(emp_id,e.getStatus());
		%>
		


			
			<div id="left"> 
				<table class="table table-hover">
					<tr>
						<td>Employee id </td><td>:</td>
						<td><%=e.getEmp_id()%></td>
					</tr>
					<tr>
						<td>Employee Name </td><td>:</td>
						<td><%=e.getEmp_name()%></td>
					</tr>
					<tr>
						<td>Email Id </td><td>:</td>
						<td><%=e.getEmail_id()%></td>
					</tr>
					<tr>
						<td>Date Of Joining </td><td>:</td>
						<td><%=e.getDoj()%></td>
					</tr>
			
			
					<tr>
						<td>Technology </td><td>:</td>
						<td><%=e.getTech()%></td>
					</tr>
					<tr>
						<td>Designation </td><td>:</td>
						<td><%=e.getRole_id()%></td>
					</tr>
					<tr>
						<td>Location </td><td>:</td>
						<td><%=e.getLocation_id()%></td>
					</tr>
					
					<tr>
						<td> Status </td><td>:</td>
						<%
						String status=e.getStatus();
						if(status.equalsIgnoreCase("available"))
							status="Available";
						if(status.equalsIgnoreCase("allocated"))
							status="Allocated";
						if(status.equalsIgnoreCase("pending"))
							status="Pending";
						%>
						<td><button type="button" class="btn btn-primary btn-lg"><%=status%></button></td>
					</tr>
				</table>
			</div>
			
			
			
		</div>



<br/>









	<div class="thumbnail" id="target"  style="width:800px">
<h3>Request List</h3>
				<form name="ajaxform" id="ajaxform"	action="/RmgAllocation/EmployeeHandler" method="POST">
					<table id="table_id" class="display" cellspacing="0" width="100%" style="color:black">
						<thead>
							<tr>
								<th>Select</th>
								<th>Project Id</th>
								<th>Project Name</th>
								<th>Domain</th>
								<th>Technology</th>
								<th>Location</th>
								<th>Branch</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (projects == null) {
									out.println("<tr><td/><td/><td/><td>");
									out.println("No Records Found");
									out.println("</td><td/><td/><td/></tr>");
								} else {
									Iterator<Project> i = projects.iterator();
									while (i.hasNext()) {
										Project p = (Project) i.next();
							%>

							<tr>
								<td><input type="radio" name="p_id"
									value="<%=p.getP_id()%>" /></td>
								<td><%=p.getP_id()%></td>
								<td><%=p.getP_name()%></td>

								<td><%=p.getDomain_id()%></td>
								<td><%=p.getTech()%></td>

								<td><%=p.getLocation_id()%></td>
								<td><%=p.getBranch_id()%></td>
							</tr>
							<%
								}
							%>
							<%
								}
							%>
						</tbody>
					</table>
					<input type="hidden" name="emp_id" value="<%= e.getEmp_id() %>"/>
					<input type="hidden" name="role_id" value="<%= e.getRole_id() %>" />
					<input type="hidden" id="hide_checks" value="<%=e.getStatus()%>" />
					<br/>
					<div id="allocated">
					<input type="radio" name="go" value="accept" checked="checked">I Accept the offer</input>&nbsp;&nbsp;
					<input type="radio" name="go" value="reject">I reject the offer</input>
					<br/><br/>
					<center> <button class="btn btn-primary btn-lg" type="submit" >Submit</button> 
					<button class="btn btn-primary btn-lg" type="reset" >Reset</button>
					</center>
					</div>
				</form>


			</div>
 
 

<br/>

<div class="thumbnail" id="ajaxResponse"  style="width:800px">
				<h1>Summary</h1>
				<table class='table table-hover'>
				<tbody>
				</tbody>
				</table>
				<p>
				<a class="btn btn-primary btn-lg" role="button" id="redirect">Back</a>
				</p>
			</div>



</div>

<div class="thumbnail">
<h3>News Feeds</h3>

<img src="/RmgAllocation/themes/images/blog/1.jpg" style="display:block; height:250px; max-height:250px; margin-bottom:18px;"/>
</div>




<div class="thumbnail">

<%
if(e.getStatus().equalsIgnoreCase("pending"))
{%>
	<h5> Please check your recent Project requests</h5><%
}
else if(e.getStatus().equalsIgnoreCase("allocated"))
{
	%>
	<h5>You have been allocated to a project</h5>
	
	<%
}
else if(e.getStatus().equalsIgnoreCase("available"))
{
	%>
	<h5>Please look for RMG updates for a project</h5>
	
	<%
}

%>
</div>


</div>

</div>


</section>
 <!-- Footer
  ================================================== -->
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
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
	
	<script src="/RmgAllocation/themes/js/bootstrap.min.js"></script>
	<script src="/RmgAllocation/themes/js/bootstrap-tooltip.js"></script>
    <script src="/RmgAllocation/themes/js/bootstrap-popover.js"></script>
	<script src="/RmgAllocation/themes/js/business_ltd_1.0.js"></script>
 
<!-- Themes switcher section ============================================================================================= -->


</body>
</html>