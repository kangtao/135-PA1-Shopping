<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
Hello <%=(String)session.getAttribute("currentSessionUserName")%></br>
Home</br>
<% 
if((String)session.getAttribute("currentSessionUserName") == null)
{
	response.sendRedirect("NoUser.jsp");
}
String userRole= (String)session.getAttribute("currentSessionUserRole");
%>
	<a href="BuyShoppingCart.jsp">BuyShoppingCart</a></br>


 <% 

session = request.getSession(true);
session.setAttribute("searchName",null); 
session.setAttribute("selectCategory",null); 
session.setAttribute("modificationFailure",null); 
session.setAttribute("insertProductFailure",null); 

%>

<a href="Categories.jsp">Categories</a></br>
<a href="Products.jsp">Products</a></br>
<a href="ProductsBrowsing.jsp">Products Browsing</a></br>
<a href="Login.jsp">Back to login</a>
</body>
</html>