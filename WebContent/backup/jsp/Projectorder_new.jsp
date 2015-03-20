<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"
	import="com.bean.Employee" import="com.dao.EmployeeDAO"
	import="com.bean.Project" import="com.bean.Request"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Register Project</title>
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

<script type="text/javascript">

function changedropdown(){
	var makev=document.myform.location_id.value;
	var modelv=document.myform.branch_id;
	modelv.options.length = 0;
	if (makev == "") {
  		modelv.options[modelv.options.length] = new Option('--Select--');
	}
	if (makev == "Ahmedabad") {
		modelv.options[modelv.options.length] = new
		Option('--Select--','');
	  	modelv.options[modelv.options.length] = new
		Option('Babral','Babral');
  		modelv.options[modelv.options.length] = new
		Option('Indore','Indore');
		modelv.options[modelv.options.length] = new
		Option('Mitapur','Mitapur');
		
	}
	if (makev == "Bangalore") {
		modelv.options[modelv.options.length] = new
		Option('--Select--','');
	  	modelv.options[modelv.options.length] = new
		Option('Manya','Manya');
  		
	}
	if (makev == "Chennai") {
		modelv.options[modelv.options.length] = new
		Option('--Select--','');
	  	modelv.options[modelv.options.length] = new
		Option('Manap','Manap');
  		
	}
	
	if (makev == "Delhi") {
		modelv.options[modelv.options.length] = new
		Option('--Select--','');
	  	modelv.options[modelv.options.length] = new
		Option('Ambala','Ambala');
  		
	}
	
	if (makev == "Hyderabad") {
		modelv.options[modelv.options.length] = new
		Option('--Select--','');
		modelv.options[modelv.options.length] = new
		Option('DP','DP');
  		modelv.options[modelv.options.length] = new
		Option('SP','SP');
		modelv.options[modelv.options.length] = new
		Option('KP','KP');
  		
	}
	
	
	if (makev == "Mumbai") {
		modelv.options[modelv.options.length] = new
		Option('--Select--','');
	  	modelv.options[modelv.options.length] = new
		Option('Boriva','Boriva');
  		
	}
	
	if (makev == "Pune") {
		modelv.options[modelv.options.length] = new
		Option('--Select--','');
	  	modelv.options[modelv.options.length] = new
		Option('VSNL','VSNL');
  		
	}
	
}



</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Registration</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script  src="/RmgAllocation/js/homenew.js"></script>
	<script  src="/RmgAllocation/js/Dropdown.js"></script>
	<script  src="/RmgAllocation/js/Project.js"></script>
</head>
<body>

<%@include file="Header.jsp" %>

<!--Header Ends================================================ -->
<!-- Page banner -->
<section id="bannerSection" style="background:url(/RmgAllocation/themes/images/banner/aboutus.png) no-repeat center center #000;">
	<div class="container" >	
		<h1 id="pageTitle">Project Management
		
		</h1>
	</div>
</section> 
<!-- Page banner end -->
<section id="bodySection">	
	<div class="container">	
	<div class="row">
		<div class="span3">
				
				
				<div class="thumbnail">
					<img
						src="/RmgAllocation/themes/images/portfolio/mywebsolution.jpg"
						alt="bootstrap business templates">
					<h4>Project Management</h4>
					<p>
						Our aim is simple <br /> Make your work easier
					</p>

				</div>
				<br />
				<div class="well well-small">
					<h3>Welcome!</h3>
					These are the recent projects which you have registered in the Website.<br />
					<br />You can change your project requirements as needed. <br />
					<br />

				</div>

			</div>
		<div class="span9">
		<div class="well well-small" style="text-align:left">
			<h3>Project Registration</h3>
			<p><img src="/RmgAllocation/themes/images/carousel/business_website_templates_3.jpg" alt="business templates" /></p>
			<p> 
				<form name="myform" id="myform" method="post" action="/RmgAllocation/ProjectHandler" autocomplete="off">


   
<table class="table table-hover" >
		
		<tr>
			<th>
				Project Name
			</th>
			<th>
				<input type="text" name="p_name" id="p_name" required title="Please enter characters of length 4-15" autofocus pattern="[a-zA-Z][a-zA-Z ]{4,15}" ></input></th>
		</tr>
		<tr>
			<th>
				Domain
			</th>
			<th>
				<select id="dropbox1" name="domain_id"  required title="Domain cannot be empty"> 
  					<option value="">--Select--</option>
					<option value="BFS">BFS</option>
  					<option value="Utilities">Utilities</option>
  					<option value="Government">Government</option>
  					<option value="Healthcare">Healthcare</option>
  					<option value="High Tech">High Tech</option>
  					<option value="Insurance">Insurance</option>
  					<option value="Life Sciences">LifeSciences</option>
  					<option value="Manufacturing">Manufacturing</option>
  					<option value="Media & IS">Media & IS</option>
  					<option value="Telecom">Telecom</option>
  					
  				</select>
			    
			</th>
			
		</tr>
		
		<tr>
				<th>Technology</th>
				<th><select name="tech" id="tech" required  title="Technology cannot be empty">
				<option value="">--Select--</option>
				<option>Java</option>
				<option>.Net</option>
				<option>C,C++</option>
				<option>MainFrames</option>
				</select>
				</th>
			</tr>
		
		
		<tr>
			<th>
				Location
			</th>
			<th>
				<select id="dropbox2" name="location_id" onclick="changedropdown();" required title="Location cannot be empty"> 
  					<option value="">--Select--</option>
					<option value="Ahmedabad">Ahmedabad</option>
  					<option value="Bangalore">Bangalore</option>
  					<option value="Chennai">Chennai</option>
  					<option value="Delhi">Delhi</option>
  					<option value="Hyderabad">Hyderabad</option>
  					<option value="Mumbai">Mumbai</option>
  					<option value="Pune">Pune</option>
  				</select>
			
			&nbsp; &nbsp; &nbsp;
				<select id="dropbox3" name="branch_id" required title="Branch cannot be empty">
				
				</select>
			</th>
		</tr>
		<tr>
			<th valign="top">
				Requirements
			</th>
			<th>
				<input type="button" id="toto" value=" Add Member " class="btn btn-small btn-info addButton"/>
			<b class='glyphicon glyphicon-plus'></b>
		<div class="form-inline">
		<div class="one">
		</div></div>
		
		<br/>
		<br /> <input type="hidden" name="x_value" id="x_value" value="0" /> 
		
			</th>
		</tr>
		 		
		 		
</table>
<input type="hidden" name="action" value="newProject"/>
<center>
	<button type="reset" id="reset"  class="btn btn-primary btn-lg"> <b class=" glyphicon glyphicon-ok-sign "> &nbsp;Reset&nbsp; </b> </button>
	<button class="btn btn-primary btn-lg"> <b class=" glyphicon glyphicon-ok-sign ">Submit</b> </button>
</center>
</form>
			
			<center>	<p id="success"> </p>  </center>

		<br/>			
				</div>
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
	<script src="/RmgAllocation/themes/js/jquery-1.8.3.min.js"></script>
	<script src="/RmgAllocation/themes/js/bootstrap.min.js"></script>
	<script src="/RmgAllocation/themes/js/bootstrap-tooltip.js"></script>
    <script src="/RmgAllocation/themes/js/bootstrap-popover.js"></script>
	<script src="/RmgAllocation/themes/js/business_ltd_1.0.js"></script>
<!-- Themes switcher section ============================================================================================= -->

	
	

</body>
</html>