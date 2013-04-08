<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Data.user"  %>
<%@ page import="java.util.*"  %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="Data.user" %>
<%@ page import="com.google.appengine.api.datastore.Entity"%>

<html>
	<title>
		Dashboard
	</title>
	
	<b>DashBoard</b>
	<br></br>
	
	<form action="/dashboard" method="post">
		<input type="text" id="searchItems" name="searchItems"/> 
		<input type="submit" value="Search"/>
	</form>
	
	<b>Activity History: </b>	
	<br></br>
	
	<% 
	String user = request.getSession().getAttribute("user").toString();
	user u = new user();
	%>
	
	<%Iterable <Entity> ent = u.getBuyHistory(user);
	for (Entity e: ent) {%>
		<br><%=e.getProperty("buy item") %></br>
		<br><%=e.getProperty("buy user") %></br>
	<%} %>
	
	<%Iterable <Entity> ent_2 = u.getSellHistory(user); 
	for (Entity e: ent_2) {%>
		<br><%=e.getProperty("sell item") %></br>
		<br><%=e.getProperty("sell user") %></br>
	<%} %>
	
	<br></br>
	<b>Recommendations: </b>
	<br></br>
	
	<form action="createItem.jsp" method="post">
		<input type="submit" value="Create Item"/>
	</form>
	
</html>