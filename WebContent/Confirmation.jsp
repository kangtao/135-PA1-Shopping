<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"
    	 import = "java.util.*"
		 import="static register.Provider.*"

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Condirmation</title>
</head>
<body>
Hello <%=(String)session.getAttribute("currentSessionUserName")%></br>
<% 
		if((String)session.getAttribute("currentSessionUserName") == null)
	   	{
			response.sendRedirect("NoUser.jsp");
	   	}
%>


<% 
	ArrayList<ArrayList<String>> myArrayList = (ArrayList<ArrayList<String>>)session.getAttribute("cart");
	ArrayList<String> subArrayList = new ArrayList<String>();
	ArrayList<String> innerArrayList; 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//try 
	//{
    	// Registering Postgresql JDBC driver with the DriverManager
    	Class.forName(DRIVER);

    	// Open a connection to the database using DriverManager
    	conn = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);

  

		String action = request.getParameter("action");
		if (action != null && action.equals("buy")) 
		{
			for (int i = 0; i < myArrayList.size(); i++) 
  			{
		    	conn.setAutoCommit(false);
	   			innerArrayList = myArrayList.get(i);

		   			String productName = innerArrayList.get(0);
		   			int amount = Integer.parseInt(innerArrayList.get(1));
		   			System.out.print((innerArrayList.get(3)));
		  	 		float price = Float.parseFloat(innerArrayList.get(2));
		  	 		int productID = Integer.parseInt(innerArrayList.get(3));
		  	 		int userID = Integer.parseInt(innerArrayList.get(4));
		  	 	  	pstmt = conn.prepareStatement("INSERT INTO purchase(userid,productid,amount,price,time) VALUES (?,?,?,?,?)");
		  			pstmt.setInt(1, userID);
		  	        pstmt.setInt(2, productID);
		  	      	pstmt.setInt(3, amount);
		  	        pstmt.setFloat(4, price);
		  	      	pstmt.setDate(5, new java.sql.Date(new java.util.Date().getTime()));
		  			pstmt.executeUpdate();
		  	 	   	conn.commit();
		  	 	   	conn.setAutoCommit(true);
		   
       			

	   
			}
			
		}
		%>
		You have successful bought</br>
		<table border="1">


		       <tr>
		           <th>Products Name</th>
		           <th>Amounts</th>
		           <th>Price</th>
		       </tr>

		<% 

		  for (int i = 0; i < myArrayList.size(); i++) 
		  {
			  innerArrayList = myArrayList.get(i);
			   if(innerArrayList.size()!=0)
			   {

				   innerArrayList= myArrayList.get(i);
				   String productName = innerArrayList.get(0);
				   int amount = Integer.parseInt(innerArrayList.get(1));
				   float price = Float.parseFloat(innerArrayList.get(2));


		%>
		          <tr>
		           <th><%=productName %></th>
		           <th><%=amount%></th>
		           <th><%=price%></th>
		       </tr>

		<%             	   
			   }
			   
			}
		session = request.getSession(true);
		session.setAttribute("cart",null); 
		%>

		   </table>
		   <% 
	//}
	//finally
	/*{
		if(rs != null  && conn != null)
		{
   			// Close the ResultSet
   			rs.close();
   			conn.close();
	}*/
//}

%>

<a href="Home.jsp">Back to home</a>
</body>
</html>