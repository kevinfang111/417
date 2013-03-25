<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"  %>
    <%@ page import="auction.login" %>
    <%@ page import="com.google.appengine.api.datastore.Entity" %>
    <%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
<link href="Site.css" rel="Stylesheet" type="text/css"/>
</head>
<body>	
	<div class="wrapper">
		<div id="Content">
			<div id="Header"><H1>Login</H1></div>
			<hr/>
			<div id="MainContent">
				<form action="login" method="post">
				<table>
					<tr>
						<td align="right">First Name:</td>
						<td align="left"><input type="text" name="Username"/></td>
					</tr>
					<tr>
						<td align="right">Last Name:</td>
						<td align="left"><input type="text" name="Password"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Login"/></td>
					</tr>
				</table>
				</form>
				
			</div><!-- end MainContent -->
		</div><!-- end Content -->
	</div><!-- end wrapper -->
</body>
</html>