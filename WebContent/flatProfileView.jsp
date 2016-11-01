<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.*, src.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>Flat Profile</title>
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



<!--  PAGE CODE -->
<%!
User user=Session.getInstance().getUser();
boolean landlord=user instanceof Landlord;
%>

<% Flat f = (Flat) request.getAttribute("flat"); %>

<h1 style="text-align:center"><%=f.getAddress() %></h1>
<div class="row text-center">
<img src=<%=f.getImageLink()%> class="img-rounded"><br>
</div>

<div>
<b>Address: </b><%= f.getAddress() %><br></a>
	<b>Property owner: </b> <a href="/FlatHuntersProject/profile/userId=<%=f.getOwner().getId() %>"><%= f.getOwner().getFirstName() %> <%= f.getOwner().getLastName() %></a><br>
	<b>Flat description: </b> <%= f.getDescription() %><br>
	<b>Price: </b> £<%= f.getPrice() %> per week<br>
	<b>Amenities included: </b><br>
<% 
	HashMap<String, String> amenities = f.getAmenityList();
	for(String a : amenities.keySet()){
		if(!amenities.get(a).equals(Flat.UNDEFINED)){
			%>
			<row><%=a %> : <%=amenities.get(a) %><br>
			<%
		}
	}
	%>
	

<%
	out.println("<form action=\"flat\" align=\"left\" method=\"GET\">");
	if(!landlord){
		out.println("<input type=\"submit\" name=\"interested\" 	value=\"I'm interested!\" />");
	}
	out.println("<input type=\"hidden\" name=\"caller\" value=\"0\">"+
			"<input type=\"hidden\" name=\"flat_id\" value=\""+f.getId()+"\">"+
			"</form>");
%>
</form>
</div>
</body>
</html>