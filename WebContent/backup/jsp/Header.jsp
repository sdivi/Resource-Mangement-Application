<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"
	import="com.bean.Employee" import="com.dao.EmployeeDAO"
	import="com.bean.Project" import="com.bean.Request"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	function disableBackButton()
	{
		window.history.forward();
	}
	setTimeout("disableBackButton()", 0);
</script>

</head>
<body onload="disableBackButton()">
<% session = request.getSession(false);
int id=(Integer)session.getAttribute("employeeid");
EmployeeDAO empdao1 = new EmployeeDAO();
Employee emp = empdao1.getEmployeeDetails(id);
String role=(String)session.getAttribute("role");

if(role.equalsIgnoreCase("pm"))
	role="Project Manager";
if(role.equalsIgnoreCase("rmg"))
	role="RMG";
if(role.equalsIgnoreCase("employee"))
	role="Employee";
if(role.equalsIgnoreCase("admin"))
	role="Admin";
%>
<input id="role" type="hidden" value=<%= (String)session.getAttribute("role")%> name="role"/>

<section id="headerSection">

	<div class="container">
		<div class="navbar">
			<div class="container">
				<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<h1 class="brand">Resource Allocation</h1>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">	
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome <%=emp.getEmp_name()%><b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>Role:<%=role %></li>
								
							</ul>
						</li>
						
						<li class=""><a href="/RmgAllocation/jsp/Homenew.jsp">Home	</a></li>
						<li class=""><a href="/RmgAllocation/jsp/Viewemployee_new.jsp">Employee</a></li>  
						
						<li class="dropdown">
							<a id="project" href="#" class="dropdown-toggle" data-toggle="dropdown">Project<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class=""><a id="project" href="/RmgAllocation/jsp/Projectorder_new.jsp">Register Project</a></li>
								<li class=""><a id="project" href="/RmgAllocation/jsp/Projectlist_new.jsp">Project List</a></li>
							</ul>
						</li>
<!-- 						<li class=""><a id="rmg" href="/RmgAllocation/jsp/blank.jsp">RMG</a></li> -->
<!-- <!-- 						<li class=""><a href="/RmgAllocation/jsp/Contact.jsp">Support</a></li> -->
						
						<li>
							<a id="rmg" href="/RmgAllocation/jsp/NewRmg.jsp">RMG</a>
						</li>
						<li class=""><a href="/RmgAllocation/LoginHandler?user=logout">Logout</a></li> 
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>