<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"  %>
    <%@ page import="com.google.appengine.api.datastore.Entity" %>
    <%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item</title>
<link href="Site.css" rel="Stylesheet" type="text/css"/>
</head>
<body>
	<form action="makeBid.jsp" method="post">
		<br> Name:         <br/> 
		<br> Description: <br/>
		<br></br>
		<input type="submit" value="Make Bid"/>
	</form>
	
	<br></br>
	<b>Previous Comments:</b>
	
	<br></br>
	<form action="item.jsp" method="post">
		<br> comment: <input type="text" id="comment" name="comment" /><br/> 
		<br></br>
		<input type="submit" value="comment"/>
	</form>
	
</body>
</html>