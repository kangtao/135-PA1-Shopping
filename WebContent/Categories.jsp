<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>

<body>
<%
//response.sendRedirect("CategoriesOwner.jsp");
String userRole= (String)session.getAttribute("currentSessionUserRole");
//System.out.print("@@@" + userRole);
//System.out.print(userRole == "owner");
if(!userRole.equals("owner"))
	out.print("This page is available to owners only");
else
	response.sendRedirect("CategoriesOwner.jsp");
%>
</br>
<a href="Home.jsp">Back to home</a>
</body>