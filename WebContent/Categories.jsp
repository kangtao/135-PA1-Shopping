<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>

<body>
Hello <%=(String)session.getAttribute("currentSessionUserName")%></br>
<% System.out.print((String)session.getAttribute("currentSessionUserName"));%></br>
<% 
if((String)session.getAttribute("currentSessionUserName") == null)
{
	response.sendRedirect("NoUser.jsp");
}
else
{
	String userRole= (String)session.getAttribute("currentSessionUserRole");
	if(!userRole.equals("owner"))
		out.print("This page is available to owners only");
	else
		response.sendRedirect("CategoriesOwner.jsp");
	

}
%>


</br>
<a href="Home.jsp">Back to home</a>
</body>