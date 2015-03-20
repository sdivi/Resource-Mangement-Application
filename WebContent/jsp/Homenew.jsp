<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  import="java.util.*"
	import="com.bean.Employee" import="com.dao.EmployeeDAO"
	import="com.bean.Project" import="com.bean.Request"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Home</title>
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
	 <script src="/RmgAllocation/js/jquery-1.11.1.js"></script>

	<script  src="/RmgAllocation/js/homenew.js"></script>
</head>
<body>
	<%@include file="Header.jsp" %>
	<!--Header Ends================================================ -->
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
						alt="business themes" style="height:300px;width:1000px">
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
					<h4>What we do?</h4>
					<p>
						"Our aim is simple - to provide resources that fully meet your project
						requirements."<br />
						<br />
					</p>
				</div>
			</div>
			<div class="span2">
				<div class="well well-small">
					<h4>
						<a href="#" class="popOver" data-placement="top"
							data-content=" > Digital Marketing<br> > Mobility<br> > Big Data"
							data-original-title="Projects..."
							style="display: block; text-decoration: none"> <i
							style="width: auto; font-size: 2em; line-height: 1em; height: auto"
							class="icon-magic"></i> <span><br />DESS</span>
						</a>
					</h4>

				</div>
			</div>
			<div class="span2">
				<div class="well well-small">
					<h4>
						<a href="#" class="popOver" data-placement="top"
							data-content=" > Bank Of America<br> > American Express<br> > Citi Bank"
							data-original-title="Projects..."
							style="display: block; text-decoration: none"> <i
							style="width: auto; font-size: 2em; line-height: 1em; height: auto"
							class="icon-link"></i> <span><br />BFS</span>
						</a>
					</h4>

				</div>
			</div>
			<div class="span2">
				<div class="well well-small">
					<h4>
						<a href="#" class="popOver" data-placement="top"
							data-content="  > Tata Docomo<br> > Telenor <br> > Belgacom "
							data-original-title="Projects... "
							style="display: block; text-decoration: none"> <i
							style="width: auto; font-size: 2em; line-height: 1em; height: auto"
							class="icon-volume-up"></i> <span><br />Telecom</span>
						</a>
					</h4>

				</div>
			</div>
			<div class="span2">
				<div class="well well-small">
					<h4>
						<a href="#" class="popOver" data-placement="top"
							data-content=" > JDSU<br> > Google Maps<br> > Hyundai"
							data-original-title="Projects..."
							style="display: block; text-decoration: none"> <i
							style="width: auto; font-size: 2em; line-height: 1em; height: auto"
							class="icon-link"></i> <span><br />EIS</span>
						</a>
					</h4>

				</div>
			</div>
			<div class="span2">
				<div class="well well-small">
					<h4>
						<a href="#" id="poverone" class="popOver" data-placement="top"
							data-content=" > Ericson  <br> > Apple  <br> > Flipkart <br> "
							data-original-title="Projects..."
							style="display: block; text-decoration: none"> <i
							style="width: auto; font-size: 2em; line-height: 1em; height: auto"
							class="icon-wrench"></i> <span><br />Tech Support</span>
						</a>
					</h4>
				</div>
			</div>
			<div class="span2">
				<div class="well well-small">
					<h4>
						<a href="#" class="popOver" data-placement="top"
							data-content=" > Maitree<br>> Facilitators<br>> l&D"
							data-original-title="Projects..."
							style="display: block; text-decoration: none"> <i
							style="width: auto; font-size: 2em; line-height: 1em; height: auto"
							class="icon-wrench"></i> <span><br />Internal Support</span>
						</a>
					</h4>

				</div>
			</div>
		</div>
	</div>
	</section>
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
	
  




	<section id="footerSection" style="height:5%">
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
	
	<script src="/RmgAllocation/themes/js/bootstrap.min.js"></script>
	<script src="/RmgAllocation/themes/js/bootstrap-tooltip.js"></script>
	<script src="/RmgAllocation/themes/js/bootstrap-popover.js"></script>
	<script src="/RmgAllocation/themes/js/business_ltd_1.0.js"></script>

	<!-- Themes switcher section ============================================================================================= -->

</body>
</html>