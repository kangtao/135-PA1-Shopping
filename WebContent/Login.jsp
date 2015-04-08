<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Welcome!</h2>
<h2>Old users please login;New users please register</h2>
<form action="process.jsp">
<input type="text" name="uname" value="Name..." onclick="this.value=''"/><br/>
<input type="submit" value="login"/>
<a href="Register.jsp">register</a>
</form>
</body>
</html>