<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="login.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<h2>Welcome!</h2>
<% String illegalName = (String)session.getAttribute("currentIllegalSessionUserName"); %>
<% if (illegalName != null)
	{
		out.print("The provided name <"+illegalName+ "> is not known");
		session = request.getSession(true);
		session.setAttribute("currentIllegalSessionUserName",null); 
	}


%>
<form action="LoginServlet">
<input type="text" name="uname" value="Name..." onclick="this.value=''"/><br/>
<input type="submit" value="login"/>
<a href="Register.jsp">register</a>
</form>
</body>
</html>