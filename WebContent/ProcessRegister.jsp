<%@page import="register.RegisterDao"%>
<jsp:useBean id="obj" class="register.User"/>

<jsp:setProperty property="*" name="obj"/>

<%
int status=RegisterDao.register(obj);
if(status>0)
	out.print("You have successfully signed up");
else
	out.print("Your signup failed");
%>

</br><a href="Login.jsp">back to login</a>