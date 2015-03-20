<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"
	import="com.bean.Employee" import="com.dao.EmployeeDAO"
	import="com.bean.Project" import="com.bean.Request"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Project List</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<link id="callCss" rel="stylesheet"
	href="/RmgAllocation/themes/current/bootstrap.min.css" type="text/css"
	media="screen" />
<link href="/RmgAllocation/themes/css/bootstrap-responsive.min.css"
	rel="stylesheet" type="text/css">
<link href="/RmgAllocation/themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<link href="/RmgAllocation/themes/css/base.css" rel="stylesheet"
	type="text/css">
<style type="text/css" id="enject"></style>

<!-- new ones -->


<script src="/RmgAllocation/themes/js/jquery-1.8.3.min.js"></script>




<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Registration</title>
<script src="/RmgAllocation/themes/js/jquery-1.8.3.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<!-- Include one of jTable styles. -->

<link href="/RmgAllocation/css/metro/crimson/jtable.css"
	rel="stylesheet" type="text/css" />
<link href="/RmgAllocation/css/jquery-ui-1.10.3.custom.css"
	rel="stylesheet" type="text/css" />
<link href="/RmgAllocation/css/validationEngine.jquery.css"
	rel="stylesheet" type="text/css" />

<!-- Include jTable script file. -->
<script src="/RmgAllocation/js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="/RmgAllocation/js/jquery-ui-1.10.3.custom.js"
	type="text/javascript"></script>
<script src="/RmgAllocation/js/jquery.jtable.js" type="text/javascript"></script>
<!-- 	<script src="/RmgAllocation/css/bootstrap/js/bootstrap.js" type="text/javascript"></script> -->

<script type="text/javascript"
	src="/RmgAllocation/js/jquery.validationEngine.js"></script>
<script type="text/javascript"
	src="/RmgAllocation/js/jquery.validationEngine-en.js"></script>



<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#projectmanager')
								.jtable(
										{
											paging : true,
											pageSize : 5,
											sorting : false,
											defaultSorting : 'p_id ASC',
											actions : {
												listAction : '/RmgAllocation/ProjectHandler?action=list',
												createAction : '/RmgAllocation/ProjectHandler?action=create',
												updateAction : '/RmgAllocation/ProjectHandler?action=update',
												deleteAction : '/RmgAllocation/ProjectHandler?action=delete'
											},
											fields : {
												p_id : {
													title : 'ProjectID',
													key : true,
													list : true,
													width : '20%',
													create : true
												},
												p_name : {
													title : 'ProjectName',
													sort :true,
													width : '10%',
													edit : false
												},
												domain_id : {
													title : 'Domain',
													width : '10%',
													edit : false
												},
												tech : {
													title : 'Technology',
													width : '10%',
													edit : false
												},
												location_id : {
													title : 'Location',
													width : '5%',
													edit : false
												},
												branch_id : {
													title : 'Branch',
													width : '5%',
													edit : false
												},
												role1 : {
													title : 'Role1',
													width : '10%',
													edit : true,
													sorting : false
												},
												role2 : {
													title : 'Role2',
													width : '10%',
													edit : true,
													sorting : false
												},
												role3 : {
													title : 'Role3',
													width : '10%',
													edit : true,
													sorting : false
												},
												role4 : {
													title : 'Role4',
													width : '10%',
													edit : true,
													sorting : false
												},
												role5 : {
													title : 'Role5',
													width : '10%',
													edit : true,
													sorting : false
												},
												role6 : {
													title : 'Role6',
													width : '10%',
													edit : true,
													sorting : false
												},
												role7 : {
													title : 'Role7',
													width : '10%',
													edit : true,
													sorting : false
												},
												role8 : {
													title : 'Role8',
													width : '10%',
													edit : true,
													sorting : false
												},
												role9 : {
													title : 'Role9',
													width : '10%',
													edit : true,
													sorting : false
												},
												role10 : {
													title : 'Role10',
													width : '10%',
													edit : true,
													sorting : false
												}
											},
											formCreated : function(event, data) {

												data.form
														.find(
																'input[name="role1"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');
												data.form
														.find(
																'input[name="role2"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');
												data.form
														.find(
																'input[name="role3"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');
												data.form
														.find(
																'input[name="role4"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');
												data.form
														.find(
																'input[name="role5"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');
												data.form
														.find(
																'input[name="role6"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');
												data.form
														.find(
																'input[name="role7"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');
												data.form
														.find(
																'input[name="role8"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');
												data.form
														.find(
																'input[name="role9"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');
												data.form
														.find(
																'input[name="role10"]')
														.addClass(
																'validate[required,custom[min[0]],custom[max[10]],custom[integer]]');

												data.form.validationEngine();
											},
											formSubmitting : function(event,
													data) {
												return data.form
														.validationEngine('validate');
											},
											//Dispose validation logic when form is closed
											formClosed : function(event, data) {
												data.form
														.validationEngine('hide');
												data.form
														.validationEngine('detach');
											}

										});
						
						$('#LoadRecordsButton').click(function(e) {
							e.preventDefault();
							var x = $('#pname').val();
							console.log(x);
							$('#projectmanager').jtable('load', {
								pname : x,
								
								locationId : $('#locationId').val()
							});
						});

						//Load all records when page is first shown
						$('#LoadRecordsButton').click();

						//$('#projectmanager').jtable('load');
						// 		table.setFont(new Font("Serif", Font.BOLD, 20));
					});
</script>



<script src="/RmgAllocation/js/homenew.js"></script>
</head>


<body>
	<%@include file="Header.jsp"%>
	<!--Header Ends================================================ -->
	<!-- Page banner -->
	<section id="bannerSection"
		style="background:url(/RmgAllocation/themes/images/banner/aboutus.png) no-repeat center center #000;">
	<div class="container">
		<h1 id="pageTitle">Project Management</h1>
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
					These are the recent projects which you have registered in the
					Website.<br />
					<br />You can change your project requirements as needed. <br />
					<br />

				</div>

			</div>
			<div class="span9">
				<div class="well well-small"
					style="text-align: left; overflow: auto">
					<h3>Projects</h3>


					
						<form class="form-inline">
						
							 <b class=" glyphicon glyphicon-ok-sign "> Project Name:</b> <input type="text" name="pname" id="pname" />
						
						
							<b class=" glyphicon glyphicon-ok-sign ">  Location:</b> <select id="locationId" name="locationId">
								<option selected="selected" value="all">All Locations</option>
								<option value="Ahmedabad">Ahmedabad</option>
								<option value="Bangalore">Bangalore</option>
								<option value="Chennai">Chennai</option>
								<option value="Delhi">Delhi</option>
								<option value="Hyderabad">Hyderabad</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Pune">Pune</option>
							</select>
						&nbsp;&nbsp;&nbsp;
						
							<button class="btn btn-primary btn-lg" type="submit" id="LoadRecordsButton" style="margin-top:0px; padding-top:0px;"> <b class=" glyphicon glyphicon-ok-sign ">Search</b> </button>
						
						</form>
					


					<div id="projectmanager"></div>



					<br />
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