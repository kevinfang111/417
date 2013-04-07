
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.util.*"  %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="Data.user" %>
<%@ page import="com.google.appengine.api.datastore.Entity"%>

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

<p>Welcome to Main Dashboard </p>


<p>Customer Name:</p>
<%user u = new user(); %>
<%u.createUser("Kevin"); %>
<%=u.retreiveUserInfo("Kevin") %>

<p>Customer Activity Buy</p>
<%u.addBuyHistory("buy Eric 1", "1");
u.addBuyHistory("buy Eric 2", "2");%>
<%Iterable <Entity> ent = u.getBuyHistory("Kevin");
	for (Entity e: ent) {%>
		<br><%=e.getProperty("buy item") %></br>
		<br><%=e.getProperty("buy user") %></br>
	<%} %>

<p>Customer Activity Sell:</p>
<%u.addSellHistory("sell Eric 1", "3");
u.addSellHistory("sell Eric 2", "4");%>
<%Iterable <Entity> ent_2 = u.getSellHistory("Kevin"); 
	for (Entity e: ent_2) {%>
		<br><%=e.getProperty("sell item") %></br>
		<br><%=e.getProperty("sell user") %></br>
	<%} %>

<p>Customer Shopping History:</p>
  <form action="/CustomerHistory.jsp" method="post">
    <div><input type="submit" value="Enter History Board" /></div>
  </form>
<p>Customer Buying Dashboard:</p>
  <form action="/buyPage.jsp" method="post">
    <div><input type="submit" value="Enter Buying Dashboard" /></div>
  </form>
<p>Customer Selling Dashboard:</p>
  <form action="/sellPage.jsp" method="post">
    <div><input type="submit" value="Enter Selling Dashboard" /></div>
  </form>

<p>Search:</p>
  <form action="/search.jsp" method="post">
    <div><input type="submit" value="Enter Search Engine" /></div>
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

    <form action="/sign" method="post">
      <div><textarea name="content" rows="3" cols="60"></textarea></div>
      <div><input type="submit" value="Post Greeting" /></div>
      <input type="hidden" name="guestbookName" value="${fn:escapeXml(guestbookName)}"/>
    </form>
  </body>
</html>