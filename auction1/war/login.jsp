<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="Data.user" %>

<html>
	<title>
		Login
	</title>
	
<form action ="/login" method="post" >
      username: <input type="text" id="username" name="username" />
      password: <input type="text" id="password" name="password" />
      <input type="submit" value="Submit" />
</form>
</html>