<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products Order</title>
</head>
<body>
Products Order</br>
Hello <%=(String)session.getAttribute("currentSessionUserName")%></br>
<% 
		if((String)session.getAttribute("currentSessionUserName") == null)
	   	{
			response.sendRedirect("NoUser.jsp");
	   	}
	
ArrayList<ArrayList<String>> myArrayList = (ArrayList<ArrayList<String>>)session.getAttribute("cart");
ArrayList<String> subArrayList = new ArrayList<String>();
ArrayList<String> testArrayList; 
	
	   
	%>
	

 
	
	<%
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String productID = request.getParameter("id");
		if(name != null && price != null)
		{
		out.print("The quantity of " + name + " you need at price of " + price + ":\n");

		%>
		<form action="BuyShoppingCart.jsp" method="POST">
                    <input type="hidden" name="action" value="add"/>
                    <input type="hidden" name="productName" value="<%=name%>"/>
                    <input type="hidden" name="productPrice" value="<%=price%>"/>
                    <input type="hidden" name="productID" value="<%=productID%>"/>
                    <input type=text value="" name="productNumber"/>
					<input type="submit" value="submit"/></td>
                </form>
		
	
	<%
	
		}
%>
	
	
	</br>  
     <table border="1">
     Shopping Cart
            <tr>
                <th>Products Name</th>
                <th>Amounts</th>
                <th>Price</th>
            </tr>

<% 
       if (myArrayList!=null)
       {
	   for (int i = 0; i < myArrayList.size(); i++) 
	   {
		   testArrayList = myArrayList.get(i);
		   if(testArrayList.size()!=0)
		   {
	
			   testArrayList = myArrayList.get(i);
    		   String productName = testArrayList.get(0);
    		   int amount = Integer.parseInt(testArrayList.get(1));
    		   float p = Float.parseFloat(testArrayList.get(2));
 		    


%>
               <tr>
                <th><%=productName %></th>
                <th><%=amount%></th>
                <th><%=p%></th>
            </tr>
     <%             	   
		   }
		   
		}
       }
%>
        </table>
     
	</br>
	<a href="ProductsBrowsing.jsp">Go back to Products Browsing</a>
	
	
</body>
</html>