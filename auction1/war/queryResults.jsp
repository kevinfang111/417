<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Data.queryItems"  %>
<%@ page import="java.util.*"  %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="Data.user" %>
<%@ page import="com.google.appengine.api.datastore.Entity"%>

<html>
	<title>
		Queried Results
	</title>
	
	<b>Queried Results</b>
	
<%
	String str = request.getSession().getAttribute("query").toString();
	queryItems q = new queryItems();
	Iterable <Entity> ent =  q.queryAll(str);
	for (Entity e: ent) {%>
		1. <br><a href="item.jsp"><%=e.getProperty("item name") %></a></br>
	<%}%>


</html>