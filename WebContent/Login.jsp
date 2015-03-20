<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  import="java.util.*"
	import="com.bean.Employee" import="com.dao.EmployeeDAO"
	import="com.bean.Project" import="com.bean.Request"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Resource Allocation</title>
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
	<script  src="/RmgAllocation/js/home.js"></script>
	<script  src="/RmgAllocation/js/validation.js"></script>
	
	
</head>
<body>
	
<h1 class="brand">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Resource Allocation</h1>

	<section id="carouselSection" style="text-align:center">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
			<div style="text-align: center" class="item active">
				<div class="wrapper">
					<img
						src="/RmgAllocation/themes/images/carousel/business_website_templates_1.jpg"
						alt="business webebsite template">
					<div class="carousel-caption">
						<h2>What we do?</h2>
						<p>We tag employees to projects as per requirements stated.</p>

					</div>
				</div>
			</div>
			<div style="text-align: center" class="item">
				<div class="wrapper">
					<img
						src="/RmgAllocation/themes/images/carousel/business_website_templates_2.jpg"
						alt="business themes">
					<div class="carousel-caption">
						<h2>Who we are?</h2>
						<p>We are the resource management group of a company. The most
							integral part of human resource management in a company.</p>

					</div>
				</div>
			</div>
			<div style="text-align: center" class="item">
				<div class="wrapper">
					<img
						src="/RmgAllocation/themes/images/carousel/business_website_templates_3.jpg"
						alt="business themes">
					<div class="carousel-caption">
						<h2>What we have done?</h2>
						<p>We have allocated the best of resources in hand to the very
							finest of projects in the company .</p>

					</div>
				</div>
			</div>
			<div style="text-align: center" class="item">
				<div class="wrapper">
					<img
						src="/RmgAllocation/themes/images/carousel/business_website_templates_4.jpg"
						alt="business themes">
					<div class="carousel-caption">
						<h2>Stats</h2>
						<p>Out of the 3,00,000 employees 2,75,000 have been allocated
							with projects of their calibre.</p>

					</div>
				</div>
			</div>
			<div style="text-align: center" class="item">
				<div class="wrapper">
					<img
						src="/RmgAllocation/themes/images/carousel/business_website_templates_5.jpg"
						alt="business themes">
					<div class="carousel-caption">
						<h2>Need help?</h2>
						<p>Contact us at the headquarters in Hyderabad.</p>

					</div>
				</div>
			</div>
		</div>

		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
	</section>
	<!-- Sectionone ends ======================================== -->
	<section id="middleSection">
	<div class="container">
		<div class="row" style="text-align: center">
			<div class="span12">
				<div class="well well-small">
					
					 <form class="form-signin" id="loginform" method="post" action="/RmgAllocation/Controller" autocomplete="off">
        <h2 class="form-signin-heading">Please sign in</h2>
        <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class="icon-user red"></i></span>
        <input type="text"class="form-control" placeholder="Employee ID" name="employeeid" id="employeeid" onblur="return validate()" onfocus="return recover()" maxlength="6" pattern="[0-9]{6,}" title="please enter digits only of length 6" required autofocus>
        <p id="error"></p>
        </div>
        <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class="icon-lock red"></i></span>
        
        <input type="password" class="form-control" placeholder="Password" name="password" id="password"  onfocus="return recover()" maxlength="10" pattern="{3,}"  title="Password cant be empty" onfocus="return recover()" required/>
        </div>
        <p id="target"></p>
        </br>
        <input type="hidden" name="user" value="login"/>
        <input type="hidden" name="ajax" value="ajax"/><br/>
        <!--  
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
         -->
        <input class="btn btn-small btn-primary " type="submit" value="Sign In"></input>
        
      </form>
      
		<p class="text-center sign-up"><a href="/RmgAllocation/Signup.jsp"><strong>Sign up</strong> for new Employee</a></p>
					
					
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