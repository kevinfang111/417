<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"  %>
    <%@ page import="com.google.appengine.api.datastore.Entity" %>
    <%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Bid</title>
<link href="Site.css" rel="Stylesheet" type="text/css"/>
</head>
<body>
	<form action="/dashboard.jsp" method="post">
		Your bid has been confirmed
		<br>Thank You.<br/>
		<div><input type="submit" value="Return to Dashboard" /></div>
  	</form>
</body>
</html>