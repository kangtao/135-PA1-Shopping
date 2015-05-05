<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products Browsing</title>
</head>

<body>
	Hello <%=(String)session.getAttribute("currentSessionUserName")%></br>
	Products Browsing</br>
	<% 
		if((String)session.getAttribute("currentSessionUserName") == null)
	   	{
			response.sendRedirect("NoUser.jsp");
	   	}
	%>
	<% 
	String userRole= (String)session.getAttribute("currentSessionUserRole");
	if(!userRole.equals("owner"))
	{
	%>
	<a href="BuyShoppingCart.jsp">Buy Shopping Cart</a></br>
	<% 
	}
	%>
	<%-- Import the java.sql package --%>
    <%@ page import="java.sql.*"
    		 import = "java.util.ArrayList"
             import="static register.Provider.*"
	%>
    <%-- -------- Open Connection Code -------- --%>
    <%
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try 
        {
        	// Registering Postgresql JDBC driver with the DriverManager
            Class.forName(DRIVER);
			// Open a connection to the database using DriverManager
            conn = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
     %>
     <%-- -------- Select Category Code -------- --%>
     <%
            // Create the statement
            Statement statement = conn.createStatement();
			// Use the created statement to SELECT
            // the student attributes FROM the Student table.
            rs = statement.executeQuery("SELECT name FROM categories");
 
     %>
    
            
		<!-- Add an HTML table header row to format the results -->
       


           
            <%-- -------- Close Connection Code -------- --%>
            <%
                // Close the ResultSet
                rs.close();

                // Close the Statement
                statement.close();

                // Close the Connection
                conn.close();
            } 
            catch (SQLException e) {

                // Wrap the SQL exception in a runtime exception to propagate
                // it upwards
                //throw new RuntimeException(e);
            	session = request.getSession(true);
    			session.setAttribute("insertProductFailure","true"); 
        		response.sendRedirect("ProductsBrowsing.jsp");
            }
            
            finally {
                // Release resources in a finally block in reverse-order of
                // their creation

                if (rs != null) 
                {
                    try 
                    {
                        rs.close();
                    } 
                    catch (SQLException e)
                    { 
                    	
                    } // Ignore
                    rs = null;
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } 
                    catch (SQLException e) { } // Ignore
                    pstmt = null;
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } 
                    
                    catch (SQLException e) { } // Ignore
                    conn = null;
                }
                
               
            }
            %>
        </table>

<table>
<tr>
<td>
	<form action="ProductsBrowsing.jsp" method="POST">
                    <input type="hidden" name="action" value="search"/>
                    <!--<input value="" name="name"/>-->
                    <th><input value="" name="keys" size="25"/></th>
                   	<th><input type="submit" value="search"/></th>
                   	
                    </form>
                    </td>
                 <td>

         </td>
<td>
</td>
</tr>



</table>

<table>
    <tr>
    	<td>
    		<table>  <%-- -------- Second category table-------- --%>
				<tr>
        			<td>    
            			<%-- -------- Open Connection Code -------- --%>
            			<%
                        
            				try 
            				{
                				// Registering Postgresql JDBC driver with the DriverManager
                				Class.forName(DRIVER);

                				// Open a connection to the database using DriverManager
                				conn = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
            			%>
            
            			<%-- -------- Select Category Code -------- --%>
            			<%
            					//ArrayList<String> a = new ArrayList<String>();
                				// Create the statement
                				Statement statement = conn.createStatement();

                				// Use the created statement to SELECT
                				// the student attributes FROM the Student table.
                				rs = statement.executeQuery("SELECT name FROM categories");
 
            			%>
            
                    
           <!-- Add an HTML table header row to format the results -->
            <table border="1">
            <tr>
                <th>Category</th>
            </tr>

  			<%
                // Iterate over the ResultSet
                while (rs.next()) 
                {
            %>
            <tr>


                <%-- Get the name --%>
					<td><form action="ProductsBrowsing.jsp" method="POST">
                    <input type="hidden" name="action" value="select"/>
                    <!--<input value="<%=rs.getString("name")%>" name="name"/>-->

                   	<input type = "submit" value=<%=rs.getString("name")%> name="name" size="45"/>
                    </form>
                    </td>

 
            </tr>

            <% }%>
                        <tr>
       
                    <td><form action="ProductsBrowsing.jsp" method="POST">
                    <input type="hidden" name="action" value="select"/>
                    <input type="submit" value="All products" name="name"/>
                	</form>
                    </td>
            </tr>


            <%-- -------- Close Connection Code -------- --%>
            <%
                // Close the ResultSet
                rs.close();

                // Close the Statement
                statement.close();

                // Close the Connection
                conn.close();
            } catch (SQLException e) {

                // Wrap the SQL exception in a runtime exception to propagate
                // it upwards
                throw new RuntimeException(e);
            }
            
            finally {
                // Release resources in a finally block in reverse-order of
                // their creation

                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) { } // Ignore
                    rs = null;
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) { } // Ignore
                    pstmt = null;
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) { } // Ignore
                    conn = null;
                }
            }
            %>
        </table><%-- -------- Second category table-------- --%>
        </td>
    </tr>
</table>
    
    
    </td>
        <td>    
            <%-- -------- !!!!!!!!!!Open Connection Code -------- --%>
            <%
            Connection conn2 = null;
            PreparedStatement pstmt2 = null;
            ResultSet rs2 = null;
            Statement statement2 = null; 
            ResultSet rs3 = null;
            int failureSource = 0;
            try 
            {
                // Registering Postgresql JDBC driver with the DriverManager
                Class.forName(DRIVER);

                // Open a connection to the database using DriverManager
                conn2 = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);


            %>
            
            <%-- -------- Select Category Code -------- --%>
            <%

            String action = request.getParameter("action");
            //System.out.print(action);
            if (action != null && action.equals("select")) 
            {
            	//System.out.print("select action");
            	Statement statement = conn2.createStatement();
            	
				// Use the created statement to SELECT
				// the student attributes FROM the Student table.
				rs3 = statement.executeQuery("SELECT name FROM categories");
				if(session.getAttribute("searchName") != null)
				{
					//System.out.print("SELECT!!");
					pstmt2 = conn2.prepareStatement("SELECT * FROM products where category = ? and name LIKE ?");
                	//System.out.print(request.getParameter("name"));
                	//System.out.print(request.getParameter("name").equals( "All products"));
                	
                	if(!request.getParameter("name").equals("All products"))
                	{
                		pstmt2.setString(1, request.getParameter("name"));
                		pstmt2.setString(2, "%"+(String)session.getAttribute("searchName")+"%");
                		session.setAttribute("selectCategory",request.getParameter("name"));
                		
                	//System.out.print(request.getParameter("name"));
                	//System.out.print("%"+(String)session.getAttribute("searchName")+"%");
                	//System.out.print("!!!!"+"run");
                	}
                	else if(request.getParameter("name").equals("All products"))
                	{
                		//pstmt2.setString(1, new String("category"));
                		System.out.print("!!!");
                		//pstmt2.setString(2, "%"+(String)session.getAttribute("searchName")+"%");
                		pstmt2 = conn2.prepareStatement("SELECT * FROM products where name LIKE ?");
                		pstmt2.setString(1, "%"+(String)session.getAttribute("searchName")+"%");
                		session.setAttribute("selectCategory",request.getParameter(null));
                	
                	}
				}
				else
				{	
					//System.out.print("PURE SELECT!!");
					pstmt2 = conn2.prepareStatement("SELECT * FROM products where category = ?");
					if(!request.getParameter("name").equals("All products"))
                	{
                		pstmt2.setString(1, request.getParameter("name"));
                		session.setAttribute("selectCategory",request.getParameter("name"));
                	}
                	else if(request.getParameter("name").equals("All products"))
                	{
                		//pstmt2.setString(1, new String("category"));
                		//pstmt2.setString(2, "%"+(String)session.getAttribute("searchName")+"%");
                		pstmt2 = conn2.prepareStatement("SELECT * FROM products");
                		session.setAttribute("selectCategory",request.getParameter(null));
                	
                	}
				}
                
                rs2 = pstmt2.executeQuery();
                statement = conn2.createStatement();

				// Use the created statement to SELECT
				// the student attributes FROM the Student table.
				rs3 = statement.executeQuery("SELECT name FROM categories");
                
            }

            else if (action != null && action.equals("search")) 
            {
            	//System.out.print("search action");
            	session = request.getSession(true);
    			session.setAttribute("searchName",request.getParameter("keys")); 
                pstmt2 = conn2.prepareStatement("SELECT * FROM products WHERE name LIKE ? and category =?");
				//System.out.print(request.getParameter("name")+"!!!!");
				if((String)session.getAttribute("selectCategory") != null)
				{
					pstmt2.setString(1, "%"+(String)session.getAttribute("searchName")+"%");
					pstmt2.setString(2, (String)session.getAttribute("selectCategory"));
				}
				else
				{
					pstmt2 = conn2.prepareStatement("SELECT * FROM products WHERE name LIKE ?");
					pstmt2.setString(1, "%"+(String)session.getAttribute("searchName")+"%");
					
				}

                

                rs2 = pstmt2.executeQuery();
                Statement statement = conn2.createStatement();

				// Use the created statement to SELECT
				// the student attributes FROM the Student table.
				rs3 = statement.executeQuery("SELECT name FROM categories");
                
            }
            else if(session.getAttribute("selectCategory") != null)
            {
            	if(session.getAttribute("searchName") != null)
            	{
            		pstmt2 = conn2.prepareStatement("SELECT * FROM products WHERE name LIKE ? and category =?");
            		pstmt2.setString(1, "%"+(String)session.getAttribute("searchName")+"%");
					pstmt2.setString(2, (String)session.getAttribute("selectCategory"));
            		
            	}
            	else
            	{
            		pstmt2 = conn2.prepareStatement("SELECT * FROM products WHERE category =?");
            		pstmt2.setString(1, (String)session.getAttribute("selectCategory"));
            	}
            	rs2 = pstmt2.executeQuery();
            	Statement statement = conn2.createStatement();
				rs3 = statement.executeQuery("SELECT name FROM categories");
            }
            else if(session.getAttribute("searchName") != null)
            {
            	//System.out.print("ONLY key");
            	if(session.getAttribute("selectCategory") != null)
            	{
            		//System.out.print("have category");
            		pstmt2 = conn2.prepareStatement("SELECT * FROM products WHERE name LIKE ? and category =?");
            		pstmt2.setString(1, "%"+(String)session.getAttribute("searchName")+"%");
					pstmt2.setString(2, (String)session.getAttribute("selectCategory"));
            		
            	}
            	else
            	{	
            		//System.out.print("No category");
            		pstmt2 = conn2.prepareStatement("SELECT * FROM products WHERE name LIKE ?");
            		pstmt2.setString(1, "%"+(String)session.getAttribute("searchName")+"%");
            	}
            	rs2 = pstmt2.executeQuery();
            	Statement statement = conn2.createStatement();
				rs3 = statement.executeQuery("SELECT name FROM categories");
            }
            
            else
            {	
            	pstmt2 = conn2.prepareStatement("SELECT * FROM products");
        		rs2 = pstmt2.executeQuery();
        		Statement statement = conn2.createStatement();
        		rs3 = statement.executeQuery("SELECT name FROM categories");
            	//System.out.print("!!!");
            }
            
 
            %>
            
               
            <%-- -------- UPDATE Code -------- --%>
            
                    
           
            <!-- Add an HTML table header row to format the results -->
            <table border="1">
            <tr>
                <th>ID</th>
                <th>name</th>
                <th>category</th>
                <th>sku</th>
                <th>price</th>
            </tr>
  <%
                // Iterate over the ResultSet
              
                	//System.out.print("!!!!tabkeaakdfg!!");
                	while (rs2.next()) 
                	{
            %>
            <tr>
             <form action="ProductsOrder.jsp" method="POST">
                    <input type="hidden" name="id" value="<%=rs2.getInt("id")%>"/>
                    <!--  <input type="hidden" name="category" value="<%=rs2.getString("category")%>"/> -->
      		<%-- Get the id --%>
                <td>
                    <%=rs2.getInt("id")%>
                </td>

                <%-- Get the name --%>
                <td>
                    <input value="<%=rs2.getString("name")%>" name="name" size="15"/>
                </td>

  				<td>
                    <input value="<%=rs2.getString("category")%>" name="category" size="15"/>
                </td>
 			
       
                <td>
                    <input value="<%=rs2.getString("sku")%>" name="sku" size="15"/>
                </td>
                     <td>
                    <input value="<%=rs2.getString("price")%>" name="price" size="15"/>
                </td>
                  <%-- Button --%>
                <td><input type="submit" value="Order"></td>
                </form>
                
                 
                
                
                
            </tr>

            <% }%>

            <%-- -------- Close Connection Code -------- --%>
            <%
            	if(rs2 != null  && conn2 != null && rs3 != null)
            	{
                // Close the ResultSet
                rs2.close();
                rs3.close();

                // Close the Statement
                //statement2.close();

                // Close the Connection
                conn2.close();
            	}
            } catch (SQLException e) 
            {

               
        		response.sendRedirect("ProductsBrowsing.jsp");
        		
            }
            catch (Exception e) 
       			{
       				// Wrap the SQL exception in a runtime exception to propagate
                       // it upwards
                       //throw new RuntimeException(e);
       				System.out.print(e);
                  
                 }
            
            finally {


                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) { } // Ignore
                    rs = null;
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) { } // Ignore
                    pstmt = null;
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) { } // Ignore
                    conn = null;
                }
            }
            %>
        </table>
        </td>
    </tr>

</table> 


</br>
<a href="Home.jsp">Back to home</a>
</body>