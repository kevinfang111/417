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
<p>Buying Board</p>


<p>Here are the item on sale<p>

<%
	item item1 = new item();
%>
<br>Item Name: <%=item1.queryItem("item1000") %></br>
<br>Current Bid: <%=item1.getCurrentBid()%></br>
<br>Item Owner: <%=item1.getItemOwner() %></br>
<br>Starting Bid: <%=item1.getstartingBid() %></br>
<br>Time Left: <%=item1.getTimeLeft() %></br>

<br>Your current bidding<p>


  <form action="/bidConfirmation.jsp" method="post">
    <div><input type="submit" value="Make Bid on this item" /></div>
  </form>
  
  
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