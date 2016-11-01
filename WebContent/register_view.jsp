<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="src.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>
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


<h1 align="center">Register</h1><br />
<br />

<form align="center" action="login" method="GET">
<input type="hidden" name="caller" value="2">

<h3>First name:<br /></h3>
<input type="text" name="first_name" />

<h3>Last name:<br /></h3>
<input type="text" name="last_name" />

<h3>Email:<br /></h3>
<input type="text" name="email" />

<h3>Password:<br /></h3>
<input type="password" name="password" />

<h3>Confirm Password:<br /></h3>
<input type="password" name="password_2" />

<h3>Mobile number:<br /></h3>
<input type="text" name="password" />

<h3>Address:<br /></h3>
<input type="text" name="address" /><br />

<fieldset>
  <legend>Type of account:</legend>
  <select name="type" >
   <option value="tenant">Tenant account</option>
   <option value="landlord">Landlord account</option>
  </select>
 </fieldset>

<br />
<br />
<input type="submit" value="Create account" />

</form>
</body>
</html>