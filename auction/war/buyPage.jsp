<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<%@ page import="com.google.appengine.api.datastore.Transaction"%>
<%@ page import="Data.item" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<br>here is the queried item:</br>
<%
	item item1 = new item();
%>
<br>Item Name: <%=item1.queryItem("item1000") %></br>
<br>Current Bid: <%=item1.getCurrentBid()%></br>
<br>Item Owner: <%=item1.getItemOwner() %></br>
<br>Starting Bid: <%=item1.getstartingBid() %></br>
<br>Time Left: <%=item1.getTimeLeft() %></br>
</html>