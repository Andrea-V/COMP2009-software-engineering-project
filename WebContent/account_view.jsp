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
<title>_account_</title>
</head>
<body>
<%!
User user=Session.getInstance().getUser();
boolean landlord=user instanceof Landlord;
ArrayList<Integer> fids;
HashMap<Integer,Flat> flat_table=DBManager.getInstance().getFlatTable();
%>
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


<!--  PAGE CODE -->
<h1 align="center"><%= Session.getInstance().getUser().getFirstName()   %>'s account page.</h1>
Account #<%= Session.getInstance().getUser().getId()   %>.<br /><br />

<table border="0">
<tr>
<td width="30%">
	<form action="account" method="GET">
	<input type="hidden" name="caller" value="0">
	<h3>Name:</h3>    	  <%= user.getFirstName()   %><br />
	<br />
	<h3>Surname:</h3> 	  <%= user.getLastName()    %><br />
	<br />
	<h3>Email:</h3>   	  <%= user.getEmail()       %><br />
	<br />
	<h3>Password:</h3>     <%= user.getPassword()    %><br />
	<br />
	<h3>Phone number:</h3> <%= user.getPhoneNumber() %><br />
	<br />
	<h3>Address:</h3>      <%= user.getAddress()     %><br />
	<br />
	<br />
	<input type="submit" name="edit" 	value="Edit values" />
	<input type="submit" name="profile" value="Public profile" />
	<% 
		if(landlord)
			out.println("<input type=\"submit\" name=\"add\" value=\"Add a flat\" />");
	%>
	</form>
</td>
<td width="70%">
<h2>
<%
if(landlord){
	out.println("Your flats:<br />");
	fids=((Landlord)user).getFlatList();
}
else{
	out.println("Insteresting flats:<br />");
	fids=((Tenant)user).getInterestingFlats();
}
%>
</h2>
<%
for(Integer i:fids){
	
	Flat f=flat_table.get(i);
	if(f==null)
		continue;
	out.println("<br /><hr><br />");
	out.println(f.toHTML());
	out.println(
			"<a href=\"flat?id="+i+"\">Click to view the details.</a>"+
			"<form align=\"right\" action=\"account\" method=\"GET\">"+
			"<input type=\"hidden\" name=\"caller\" value=\"3\" />"+
			"<input type=\"hidden\" name=\"flat_id\" value=\""+i+"\" />"+
			"<input type=\"submit\" name=\"remove\" value=\"Remove\" />"+
			"</form>"
			);
	
}

%>
</td>
</tr>
</table>
</body>
</html>
