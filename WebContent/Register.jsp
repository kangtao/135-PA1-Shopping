<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
<h2>Welcome!</h2>
<h2>Please register</h2>
<form action="ProcessRegister.jsp">
<input type="text" name="uname" value="Name..." onclick="this.value=''"/><br/>
 <%-- <input type="text" name="role"  value="Role" onclick="this.value=''"/><br/>
<input type="number" name="quantity" min="1" max="200" /><br/>
<input type="text" name="state"  value="State" onclick="this.value=''"/><br/>--%>
<input type="submit" value="register"/>
</form>
</body>
</html>