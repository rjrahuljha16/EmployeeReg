<!DOCTYPE html>

<html>
<head>
<% 
response.setHeader("Cache-Control","no-cache"); //forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
%>
<%
String userName = (String) session.getAttribute("name");
if (null == userName) {
  request.setAttribute("Error", "Session has ended.  Please login.");
   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
   rd.forward(request, response);
}
%>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}
.header 
{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background-color: lightblue;
	color: white;
	text-align: center;
	height: 50px;
}
.logoutLblPos {
	padding: 10px 10px;
	position: fixed;
	right: 15px;
	top: 25px;
	background-color: black;
}

.dropbtn {
	background-color:   #80e5ff;
	color: white;
	padding: 15px;
	font-size: 16px;
	border: none;
}

.dropdown {
	position: absolute;
	display: inline-block;
	right: 130px;
	top:1px;
	
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: lightblue;
	min-width: 100px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;

}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	width:10px;
}

.dropdown-content a:hover {
	background-color: lightblue;
}

.dropdown:hover .dropdown-content {
	display: block;
	background-color: lightblue;
	
}

.dropdown:hover .dropbtn {
	background-color: lightblue;
}

.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: lightblue;
	color: white;
	text-align: center;
}

.link {
	margin: 100px;
}

a:link, a:visited {
	background-color: white;
	color: black;
	border: 2px solid lightblue;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: 30%;
	margin: 10px;
	margin-bottom: 0px;
}

a:hover, a:active {
	background-color: lightblue;
	color: white;
}
</style>
</head>
<center>
	<body>
		<div class="link">
			<a href="register.jsp">Register New Employee</a><br> <a
				href="TableServlet">List of All Employees</a>
		</div>
</center>
<div class="header">
	<h2>Employee Management System</h2>
	<div class="dropdown">
		<button class="dropbtn">${name}</button>
		<div class="dropdown-content">
			<a href="Logout">Logout</a>
		</div>
	</div>
</div>

<div class="footer">
	<h2>Employees Login Form</h2>

</div>

</body>
</html>