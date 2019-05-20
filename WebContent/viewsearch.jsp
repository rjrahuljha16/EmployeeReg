<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid lightblue;
}

.header {
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
	padding: 10px 20px;
	position: fixed;
	right: 15px;
	top: 25px;
	background-color: black;
}

.dropbtn {
	background-color: #80e5ff;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
}

.dropdown {
	position: absolute;
	display: inline-block;
	right: 130px;
	top: 1px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #80e5ff;
	min-width: 100px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #80e5ff;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #80e5ff;
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

a:hover, a:active {
	background-color: lightblue;
	color: white;
}

.container {
	width: 700px;
	position: absolute;
	left: 25%;
	top: 14%;

}

.link {
	margin: 100px;
	width: 25%;
}

a:link, a:visited {
	background-color: white;
	color: black;
	border: 2px solid lightblue;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin-bottom: 0px;
	right: 15px;
}

a:hover, a:active {
	background-color: lightblue;
	color: white;
}
.tabledata{
height:450px;
display:block;
overflow:auto;
}
</style>
</head>
<body>
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
	<div class="link">
		<a href="mainpage.jsp">Back</a><br>
	</div>
	<div class="container">
		<form action="Search" method="post">
			<table>
				<tr>
					<td><input type="text" name="search" placeholder="Search...">
					</td>
					<td>&nbsp;&nbsp;</td>
					<td>
						<button type="submit">Search</button>
				</tr>
			</table>
		</form>
		<c:choose>
			<c:when test="${empty empList}">
				<h3>No Record found</h3>
			</c:when>
			<c:otherwise>
					<div class="tabledata">
				<table border="1">
					<caption>
						<b>List of Employee</b>
					</caption>
					<tr>
						<th>Emp ID</th>
						<th>Name</th>
						<th>Date of joining</th>
						<th>Date of birth</th>
						<th>Department</th>
						<th>Designation</th>
						<th>Action</th>
					</tr>
					<c:forEach var="row" items="${empList}">
						<tr>
							<td><c:out value="${row.emp_id}" /></td>
							<td><c:out value="${row.emp_name}" /></td>
							<td><c:out value="${row.doj}" /></td>
							<td><c:out value="${row.dob}" /></td>
							<td><c:out value="${row.emp_dept}" /></td>
							<td><c:out value="${row.emp_desg}" /></td>
							<td><a
								href="EditEmployee.jsp?id=<c:out value='${row.emp_id}'/>
						&name=<c:out value='${row.emp_name}'/>
						&doj=<c:out value='${row.doj }'/>
						&dob=<c:out value='${row.dob}'/>
						&dept=<c:out value='${row.emp_dept}'/>
						&desg=<c:out value='${row.emp_desg }'/>">Edit</a>
						</tr>
					</c:forEach>
				</table>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>