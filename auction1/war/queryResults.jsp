<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"  %>
    <%@ page import="com.google.appengine.api.datastore.Entity" %>
    <%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query Results</title>
<link href="Site.css" rel="Stylesheet" type="text/css"/>
</head>
<body>

	<b>Query Results: </b>
	<br></br>
	<br></br>

	<% Iterable<Entity> item = (Iterable<Entity>)request.getAttribute("item"); %>
	<form action="Item" method="post">
		<%=request.getParameter("item")%>
		<select name="itemID">
		<option value="">
		List of Item.</option>
		
		<% for( Entity e :item  ) { %>
			<href="item.jsp"><option><%=e.getKey().getName() %></option>
			<%request.getSession().setAttribute("item name", e.getKey().getName().toString());%>
		<%}%>
		</select>
		Search:<input type="submit" value="Search"/>
	</form>
</body>
</html>