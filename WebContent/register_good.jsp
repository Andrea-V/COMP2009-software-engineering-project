<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="src.Session" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<meta HTTP-EQUIV="REFRESH" content="3; url=account">
<title>Welcome!</title>
</head>
<body>
<h3>
<%= Session.getInstance().getUser().getFirstName()%> <%= Session.getInstance().getUser().getLastName()%>, welcome to FlatHunter!  <br />

If you're not redirected to your account page within a few seconds, please click <a href="account">here</a>.
</h3>
</body>
</html>