<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<% 
response.setHeader("Cache-Control","no-cache"); //forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
%>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.header {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background-color: lightblue;
	color: white;
	text-align: center;
	padding: 0px;
	height:50px;
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
button {
	background-color: lightblue;
	color: white;
	padding: 14px 10px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	text-align: center;
}
#button1 {
	width: 100px;
	height: 40px;
}

#button2 {
	width: 100px;
	height: 40px;
}
button:hover {
	opacity: 0.5;
}

.container {
	width: 300px;
	height: 300px;
	position: absolute;
	left: 39%;
	top: 30%;
}
.error{
text-align: center;
margin:100px;
color:lightblue;

</style>
</head>
<c:if test="${Error!=null }">
<p style=text-align:center;margin:100px;;position:fixed;color:red;left:33%;>Session Expired! Please login again. </p>
</c:if>
<body>
	<form action="LoginServlet" method="get">
		<div class="container">
			<label for="uname"><b>Username</b></label><br> <input
				type="text" placeholder="Enter Username" name="n1" required>
			<label for="psw"><b>Password</b></label><br> <input
				type="password" placeholder="Enter Password" name="n2" required>
			<button type="submit" id="button1">Login</button>
		</div>
		<div class="header">
			<h2>Employee Management System</h2>
		</div>
		<div class="footer">
			<h2>Employees Login Form</h2>
		</div>
	</form>
</body>
</html>