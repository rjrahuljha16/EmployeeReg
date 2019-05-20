<%@page import="java.text.SimpleDateFormat,java.util.Date" %>
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
	border: 3px solid #f1f1f1;
	margin-bottom: 30px;
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

.container {
	width: 400px;
	height: 400px;
	position: absolute;
	left: 35%;
	top: 25%;
}

.table1 {
	margin: 10px;
}

.submit1 {
	background-color: #4CAF50;
	color: white;
	font-size: 16px;
	border: none;
}

a:hover, a:active {
	background-color: lightblue;
	color: white;
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
	margin: 10px;
	margin-bottom: 0px;
}

a:hover, a:active {
	background-color: lightblue;
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<form name="f1" action="EditServlet" method="post">
			<table align="center">
				<caption>
					<h3>
						Modification Page
						<h3>
				</caption>
				<div class="table1">
					<tr>
						<td><label>Employee id </label></td>
						<%
						SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");// change the Date to String type and date format .format().  
						SimpleDateFormat toDateFormat=new SimpleDateFormat("dd-MM-yyyy");//to change from String to Date type .parse() is used.
					Date doj1=toDateFormat.parse(request.getParameter("doj"));
					Date dob1=toDateFormat.parse(request.getParameter("dob"));
							String id = request.getParameter("id");
							String name=request.getParameter("name");
							String doj = dateFormat.format(doj1);
							String dob = dateFormat.format(dob1);
							String dept = request.getParameter("dept");
							String desg = request.getParameter("desg");
						%>
						<td><input type="text" value="<%=id%>" name="id" readonly></td>
					</tr>
					<tr>

						<td><pre></pre></td>

					</tr>
					<tr>
					<td><label>Full Name</label></td>
					<td><input type="text" value="<%=name %>" name="n1" ></td>
					</tr>
					<tr>

						<td><pre></pre></td>

					</tr>
					<tr>
						<td><label for="id3">Date of joining </label></td>
						<td><input type="date" name="n2" id="id3" Value=<%=doj%>
							required></td>
					</tr>
					<tr>

						<td><pre></pre></td>

					</tr>
					<tr>
						<td><label for="id4">Date of birth </label></td>
						<td><input type="date" data-date-inline-picker="true"
							name="n3" id="id4" value=<%=dob%> required></td>
					</tr>
					<tr>

						<td><pre></pre></td>

					</tr>
					<tr>
						<td><label for="id5">Depertment</label></td>
						<td><select name="n4">
								<option><%=dept%></option>
								<option value="IT">IT</option>
								<option value="Admin">Admin</option>
								<option value="HR">HR</option>
						</select></td>
					</tr>
					<tr>

						<td><pre></pre></td>

					</tr>
					<tr>
						<td><label for="id5">Designation </label></td>
						<td><select name="n5">
								<option><%=desg%></option>
								<option value="Developer">Developer</option>
								<option value="Senior Developer">Senior Developer</option>
								<option value="Testing">Testing</option>
								<option value="Quality ">Quality</option>
						</select></td>
					</tr>
					<tr>

						<td>&nbsp;</td>

					</tr>
				</div>
				<div class="submit1">
					<tr>
						<td><input type="submit" value="Save"></td>
					</tr>
				</div>
			</table>
		</form>
	</div>
	<div class="header">
		<h2>Employee Management System</h2>
		<div class="dropdown">
			<button class="dropbtn">${name}</button>
			<div class="dropdown-content">
				<a href="Logout">Logout</a>
			</div>
		</div>
	</div>
	<div class="link">
		<a href="TableServlet">Back</a><br>
	</div>

	<div class="footer">
		<h2>Employees Login Form</h2>

	</div>

</body>

</html>