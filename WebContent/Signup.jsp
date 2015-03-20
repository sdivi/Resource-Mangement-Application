<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  import="java.util.*"
	import="com.bean.Employee" import="com.dao.EmployeeDAO"
	import="com.bean.Project" import="com.bean.Request"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Sign Up</title>
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
	
	<script src="/RmgAllocation/themes/js/jquery-1.8.3.min.js"></script>
	 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 

	<script  src="/RmgAllocation/js/homenew.js"></script>
	<script  src="/RmgAllocation/js/Signup.js"></script>
</head>
<body>
	
<h1 class="brand">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Resource Allocation</h1>

	
	<section id="middleSection">
	<div class="container" align="center">
		<div class="row" style="text-align: center">
			<div class="span10"  align="center">
				<div class="well well-small"  align="center">
					
					<form align="center" name="add" id="add" method="post" action="/RmgAllocation/EmployeeHandler" autocomplete="off">		
		
		
				<table class="table" align="center">
				<tr>
				<th style="padding: 20px" colspan="2"><font size="8"><center>Sign Up</center></font></th>
				</tr>
			<tr>
				<th>Employee ID</th>
				<th><input type="text" id="e_id" name="e_id" required autofocus  maxlength=6  pattern="[0-9]{6,6}" title="Please enter digits only of length 6" required></th>
			</tr>
			<tr>
				<th>Employee Name</th>
				<th><input type="text" id="emp_name" name="emp_name" maxlength=15 required pattern="[a-zA-Z][a-zA-Z ]{4,}" title="Please enter alphabets only of minimum length 5"></th>
			</tr>
			<tr>
				<th>Password</th>
				<th><input type="password" id="password" name="password" maxlength=10 pattern="{3,}" title="please choose password of minimum length 3" required ></th>
			</tr>
			<tr>
				<th>Email ID</th>
				<th><input type="email" id="emailid" name="emailid" maxlength=25 required></th>
			</tr>
			<tr>
				<th>Date Of Joining</th>
				<%
							java.text.DateFormat df = new java.text.SimpleDateFormat(
									"yyyy-MM-dd");
				%>
				<th><input type="date" name="date" id="date" required min="<%=df.format(1970-10-22) %>" max="<%=df.format(new java.util.Date())%> " ></th>
			</tr>
			<tr>
				<th>Technology</th>
				<th><select name="tech" id="tech" required title="Technology cannot be empty">
				<option value="">--select--</option>
				<option>Java</option>
				<option>.Net</option>
				<option>C,C++</option>
				<option>MainFrames</option>
				</select>
				</th>
			</tr>
			<tr>
				<th>Designation</th>
				<th><select  name="role" id="role" required title="Designation cannot be empty">
				<option value="">--select--</option>
				<option value="Role1">Role1</option>
				<option value="Role2">Role2</option>
				<option value="Role3">Role3</option>
				<option value="Role4">Role4</option>
				<option value="Role5">Role5</option>
				<option value="Role6">Role6</option>
				<option value="Role7">Role7</option>
				<option value="Role8">Role8</option>
				<option value="Role9">Role9</option>
				<option value="Role10">Role10</option>
				
				</select>
				</th>
			</tr>
			
			<tr>
				<th>Domain</th>
				<th><select  name="domain" id="domain" required title="Domain cannot be empty">
					<option value="">--Select--</option>
					<option value="BFS">BFS</option>
  					<option value="Utilities">Utilities</option>
  					<option value="Government">Government</option>
  					<option value="Healthcare">Healthcare</option>
  					<option value="High Tech">High Tech</option>
  					<option value="Insurance">Insurance</option>
  					<option value="Life Sciences">Life Sciences</option>
  					<option value="Manufacturing">Manufacturing</option>
  					<option value="Media & IS">Media & IS</option>
  					<option value="Telecom">Telecom</option>
				</select>
				</th>
			</tr>
			<tr>
				<th>Location</th>
				<th><select  name="location" id="loaction" required title="Location cannot be empty">
					<option value="">--Select--</option>
					<option value="Ahmedabad">Ahmedabad</option>
  					<option value="Bangalore">Bangalore</option>
  					<option value="Chennai">Chennai</option>
  					<option value="Delhi">Delhi</option>
  					<option value="Hyderabad">Hyderabad</option>
  					<option value="Mumbai">Mumbai</option>
  					<option value="Pune">Pune</option>
				</select>
				</th>
			</tr>
			</table>
			
								
				<p>
					<input type="hidden" name="Employee" value="signup"/>
					<a class="btn btn-success btn-lg" href="/RmgAllocation/Login.jsp">&nbsp;Login &nbsp;<b class="glyphicon glyphicon-warning-sign"></b></a>
					<button type="reset" class="btn btn-success btn-lg">&nbsp;&nbsp;Reset &nbsp;<b class="glyphicon glyphicon-remove-circle"></b></button>
					<button type="submit" onclick="return validation()" class="btn btn-success btn-lg ">Register<b class="glyphicon glyphicon-ok-circle"></b></button>
				</p>

</form>			
	
	<p id="ajax"> </p>				
					
				</div>
			</div>
			
			
			
			
			
		</div>
	</div>
	</section>




	<section id="footerSection">
	<div class="container">
		<footer class="footer well well-small">

		<h4>Digital Marketing</h4>


		</footer>
	</div>
	</section>
	<a href="#" class="btn"
		style="position: fixed; bottom: 38px; right: 10px; display: none;"
		id="toTop"> <i class="icon-arrow-up"></i> Go to top
	</a>
	<!-- Javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="http://platform.twitter.com/widgets.js"></script>

	<script src="/RmgAllocation/themes/js/bootstrap.min.js"></script>
	<script src="/RmgAllocation/themes/js/bootstrap-tooltip.js"></script>
	<script src="/RmgAllocation/themes/js/bootstrap-popover.js"></script>
	<script src="/RmgAllocation/themes/js/business_ltd_1.0.js"></script>

	<!-- Themes switcher section ============================================================================================= -->

</body>
</html>