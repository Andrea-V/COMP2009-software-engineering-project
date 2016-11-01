<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="src.Session" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>_account_:edit</title>
</head>
<!--  NAVIGATION BAR -->
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="search">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="search?full=true">Search</a></li>
        <% 
      	if(Session.getInstance().getUser()!=null)
      		out.println("<li><a href=\"account\">Account</a></li>");
      	%>
      </ul>
      <!-- 
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      -->
      
      <ul class="nav navbar-nav navbar-right">
      <% 
      	if(Session.getInstance().getUser()==null)
      		out.println("<li><a href=\"login?caller=0&type=login\">Login</a></li>");

      	if(Session.getInstance().getUser()==null)
      		out.println("<li><a href=\"login?caller=0&type=register\">Register</a></li>");
      	
      	if(Session.getInstance().getUser()!=null)
      		out.println("<li><a href=\"login?caller=0&type=logout\">Logout</a></li>");
      %>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<body>
<h1 align="center">Edit account information</h1>
<form action="account" align="center" method="GET">
<input type="hidden" name="caller" value="1">
<h3>Name:</h3>    	  <input type="text" name="first_name" size="25" value="<%= Session.getInstance().getUser().getFirstName()   %>"><br />
<h3>Surname:</h3> 	  <input type="text" name="last_name" size="25" value="<%= Session.getInstance().getUser().getLastName()    %>"><br />
<h3>Email:</h3>   	  <input type="text" name="email" size="25" value="<%= Session.getInstance().getUser().getEmail()       %>"><br />
<h3>Password:</h3>     <input type="text" name="password" size="25" value="<%= Session.getInstance().getUser().getPassword()    %>"><br />
<h3>Phone number:</h3> <input type="text" name="phone" size="25" value="<%= Session.getInstance().getUser().getPhoneNumber() %>"><br />
<h3>Address:</h3>      <input type="text" name="address" size="25" value="<%= Session.getInstance().getUser().getAddress()     %>"><br />
<input type="submit" value="Submit" />
</form>
</body>
</html>