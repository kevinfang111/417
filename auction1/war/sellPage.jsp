<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<%@ page import="com.google.appengine.api.datastore.Transaction"%>
<%@ page import="Data.item" %>

<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

  <body>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
      pageContext.setAttribute("user", user);
%>
<p>Hello, (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>

<p>Selling Board</p>

Creating Item:
<%	
	item item1 = new item();
	item1.createItem("item 1", "Kevin",  "itemID000", "This is a description of the item",1000, 10);
%>

<br><% item1.queryItem("item 1"); %></br>

Create Auction:
<%item1.createAuction(item1.getItemID(), 10, 11, "auctionID000"); %>
<%item1.createAuction(item1.getItemID(), 10, 11, "auctionID001"); %>
<%item1.createAuction(item1.getItemID(), 10, 11, "auctionID002"); %>
<%item1.createAuction(item1.getItemID(), 10, 11, "auctionID003"); %>
<%item1.createAuction(item1.getItemID(), 10, 11, "auctionID004"); %>
<% Iterable <Entity> ent = item1.getAuctionList();
	for (Entity e: ent) {%>
		<br><%= e.getKey().getName() %></br>
	<% }
%>

Bid Item
<%item1.createBid(item1.getAuctionID(), "Kevin", 100, "bidID000"); %>
  <form action="/sellConfirmation.jsp" method="post">
    <div><input type="submit" value="Confirm to Sell" /></div>
  </form>
 
 
<p>Your comments<p>


<p>rating <p>

  <form action="/dashboard.jsp" method="post">
    <div><input type="submit" value="Back to dashboard" /></div>
  </form>
<%
    } else {
%>
<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
to include your name with greetings you post.</p>
<%
    }
%>

  </body>
</html>