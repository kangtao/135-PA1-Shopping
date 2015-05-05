<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ page import="java.sql.*"
    		 import = "java.util.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>
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
ArrayList<String> testArrayList; 
float totalPrice = 0;
%>

<%      
myArrayList = (ArrayList<ArrayList<String>>)session.getAttribute("cart");
       // Check if an insertion is requested
       String action = request.getParameter("action");
       if (action != null && action.equals("add")) 
       {
		   if(myArrayList == null)
		   {
			   
			   session.setAttribute("cart", new ArrayList<ArrayList<String>>());
			   myArrayList = (ArrayList<ArrayList<String>>)session.getAttribute("cart");
		   }
    	   subArrayList = new ArrayList<String>();
    	   subArrayList.add(request.getParameter("productName"));    
    	   subArrayList.add(request.getParameter("productNumber")); 
    	   subArrayList.add(request.getParameter("productPrice"));
    	   subArrayList.add(request.getParameter("productID"));
    	   subArrayList.add((String)session.getAttribute("currentSessionUserID"));
    	   myArrayList.add(subArrayList);
    	   
       }
     %>
  </br>   
Shopping Cart</br>
<table border="1">


       <tr>
           <th>Products Name</th>
           <th>Amounts</th>
           <th>Price</th>
       </tr>

<% 
  if( myArrayList != null)
  {
  for (int i = 0; i < myArrayList.size(); i++) 
  {
	   testArrayList = myArrayList.get(i);
	   if(testArrayList.size()!=0)
	   {

		   testArrayList = myArrayList.get(i);
		   String productName = testArrayList.get(0);
		   int amount = Integer.parseInt(testArrayList.get(1));
		   float price = Float.parseFloat(testArrayList.get(2));
		   totalPrice = totalPrice + amount * price;


%>
          <tr>
           <th><%=productName %></th>
           <th><%=amount%></th>
           <th><%=price%></th>
       </tr>

<%             	   
	   }
	   
	}
  }
%>

   </table>
</br>
   <table>
   <tr>
             <th>Total Price:</th>
			<th><%=totalPrice%></th>
   </tr>
   </table>
   
   <table>
   <tr>
                <form action="Confirmation.jsp" method="POST">
                    <input type="hidden" name="action" value="buy"/>
                    <th>&nbsp;</th>
                    <th>Credit Card</th>
                    <th><input value="" name="creditCard" size="15"/></th>
                    <th><input type="submit" value="Purchase"/></th>
                </form>
            </tr>
   
   
   </br>
    <table>
<a href="ProductsBrowsing.jsp">Go back to Products Browsing</a></br>
<a href="Home.jsp">Back to home</a>
</body>
</html>