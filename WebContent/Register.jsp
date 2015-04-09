<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
<h3>Please register</h3>
<form action="ProcessRegister.jsp">
Name <input type="text" name="uname" value="" onclick="this.value=''"/><br/>

Role&nbsp&nbsp&nbsp<SELECT NAME="urole">
<OPTION value="Owner">Owner</OPTION>
<OPTION value="Customer">Customer</OPTION>
</SELECT><br/>
<%--<input type="text" name="urole"  value="Role" onclick="this.value=''"/><br/> --%>

Age&nbsp&nbsp&nbsp&nbsp<input type="text" name="uage"	value="Age"	onclick="this.value=''" /><br/>
<%--<input type="text" name="ustate"  value="State" onclick="this.value=''"/><br/>--%>

State&nbsp&nbsp
<SELECT NAME="ustate">
<OPTION value="Alabama">Alabama</OPTION>
<OPTION value="Alaska">Alaska</OPTION>
<OPTION value="Arizona">Arizona</OPTION>
<OPTION value="Arkansas">Arkansas</OPTION>
<OPTION value="California">California</OPTION>
<OPTION value="Colorado">Colorado</OPTION>
<OPTION value="Connecticut">Connecticut</OPTION>
<OPTION value="Delaware">Delaware</OPTION>
<OPTION value="Florida">Florida</OPTION>
<OPTION value="Georgia">Georgia</OPTION>
<OPTION value="Hawaii">Hawaii</OPTION>
<OPTION value="Idaho">Idaho</OPTION>
<OPTION value="Illinois">Illinois</OPTION>
<OPTION value="Indiana">Indiana</OPTION>
<OPTION value="Iowa">Iowa</OPTION>
<OPTION value="Kansas">Kansas</OPTION>
<OPTION value="Kentucky">Kentucky</OPTION>
<OPTION value="Louisiana">Louisiana</OPTION>
<OPTION value="Maine">Maine</OPTION>
<OPTION value="Maryland">Maryland</OPTION>
<OPTION value="Massachusetts">Massachusetts</OPTION>
<OPTION value="Michigan">Michigan</OPTION>
<OPTION value="Minnesota">Minnesota</OPTION>
<OPTION value="Mississippi">Mississippi</OPTION>
<OPTION value="Missouri">Missouri</OPTION>
<OPTION value="Montana">Montana</OPTION>
<OPTION value="Nebraska">Nebraska</OPTION>
<OPTION value="Nevada">Nevada</OPTION>
<OPTION value="New Hampshire">New Hampshire</OPTION>
<OPTION value="New Jersey">New Jersey</OPTION>
<OPTION value="New Mexico">New Mexico</OPTION>
<OPTION value="New York">New York</OPTION>
<OPTION value="North Carolina">North Carolina</OPTION>
<OPTION value="North Dakota">North Dakota</OPTION>
<OPTION value="Ohio">Ohio</OPTION>
<OPTION value="Oklahoma">Oklahoma</OPTION>
<OPTION value="Oregon">Oregon</OPTION>
<OPTION value="Pennsylvania">Pennsylvania</OPTION>
<OPTION value="Rhode Island">Rhode Island</OPTION>
<OPTION value="South Carolina">South Carolina</OPTION>
<OPTION value="South Dakota">South Dakota</OPTION>
<OPTION value="Tennessee">Tennessee</OPTION>
<OPTION value="Texas">Texas</OPTION>
<OPTION value="Utah">Utah</OPTION>
<OPTION value="Vermont">Vermont</OPTION>
<OPTION value="Virginia">Virginia</OPTION>
<OPTION value="Washington">Washington</OPTION>
<OPTION value="West Virginia">West Virginia</OPTION>
<OPTION value="Wisconsin">Wisconsin</OPTION>
<OPTION value="Wyoming">Wyoming</OPTION>
</SELECT><br/>

<input type="submit" value="register"/>
</form>
</body>
</html>