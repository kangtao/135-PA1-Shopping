<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<body>
	Hello <%=(String)session.getAttribute("currentSessionUserName")%></br>
	<% 
		if((String)session.getAttribute("currentSessionUserName") == null)
	   	{
			response.sendRedirect("NoUser.jsp");
	   	}
	%>
	Products</br>
	<% 
	//System.out.print((String)session.getAttribute("insertProductFailure") );
		if((String)session.getAttribute("insertProductFailure") == "true")
		{
			System.out.print("true");
			out.print("Failure to insert new product");
			session = request.getSession(true);
			session.setAttribute("modificationFailure",null); 
		}
		else if((String)session.getAttribute("insertProductFailure") == "false")
		{
			System.out.print("flase");
			out.print("Success to insert new product");
			session = request.getSession(true);
			session.setAttribute("modificationFailure",null); 
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
     <%-- -------- INSERT Code -------- --%>
     <%
            String action = request.getParameter("action");
           	boolean failure = false;
            // Check if an insertion is requested
            if (action != null && action.equals("insert")) {
			try
			{
            	// Begin transaction
                conn.setAutoCommit(false);
				// Create the prepared statement and use it to
                // INSERT student values INTO the students table.
                pstmt = conn.prepareStatement("INSERT INTO products (name,category,sku,price) VALUES (?,?,?,?)");
				pstmt.setString(1, request.getParameter("name"));
                pstmt.setString(2, request.getParameter("category"));
                pstmt.setString(3, request.getParameter("sku"));
                pstmt.setFloat(4, Float.parseFloat(request.getParameter("price")));
                pstmt.executeUpdate();
				// Commit transaction
                conn.commit();
                conn.setAutoCommit(true);
                          
                          
            }
			
            catch (Exception e) 
			{
				// Wrap the SQL exception in a runtime exception to propagate
                // it upwards
                //throw new RuntimeException(e);
				System.out.print(e);
                failure = true;
                session = request.getSession(true);
           		session.setAttribute("insertProductFailure","true"); 
               	response.sendRedirect("ProductsOwner.jsp");
            }
            finally
            {
        		if(failure == false)
               	{
               		session = request.getSession(true);
            		session.setAttribute("insertProductFailure","false"); 
                	response.sendRedirect("ProductsOwner.jsp"); 
                }
                   
            }

        }
                
     %>
                       
		<!-- Add an HTML table header row to format the results -->
        <table border="1">
        table2
        <tr>
        	<th>ID</th>
        	<th>name</th>
        	<th>category</th>
        	<th>sku</th>
        	<th>price</th>
        </tr>
		<tr>
        	<form action="ProductsOwner.jsp" method="POST">
            <input type="hidden" name="action" value="insert"
            />
            <!--  <input type="hidden" name="action" value="search"
            />-->
            <input type="hidden" name="keys" value=<%=(String)session.getAttribute("searchName")%>/>
            <th>&nbsp;</th>
            <th><input value="" name="name" size="10"/></th>
            <th><SELECT name="category">
            <%  
            	while(rs.next())
                { 
            %>
            <option><%= rs.getString(1)%></option>
        	<% 
        		} 
        	 %>
				</SELECT></th>
			<th><input value="" name="sku" size="15"/></th>
            <th><input value="" name="price" size="15"/></th>
            <th><input type="submit" value="Insert"/></th>
            </form>
         </tr>

           
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
        		response.sendRedirect("ProductsOwner.jsp");
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
table3
<tr>
<td>
	<form action="ProductsOwner.jsp" method="POST">
                    <input type="hidden" name="action" value="search"/>
                    <!--<input value="" name="name"/>-->
                    <th><input value="" name="keys" size="25"/></th>
                   	<th><input type="submit" value="search"/></th>
                   	
                    </form>
                    </td>
<td>
</td>
</tr>



</table>

<table>
table4
    <tr>
    	<td>
    		<table>  <%-- -------- Second category table-------- --%>
				table5
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
                while (rs.next()) {
            %>
            <tr>


                <%-- Get the name --%>
					<td><form action="ProductsOwner.jsp" method="POST">
                    <input type="hidden" name="action" value="select"/>
                    <!--<input value="<%=rs.getString("name")%>" name="name"/>-->
                   	<input type = "submit" value=<%=rs.getString("name")%> name="name" size="45"/>
                    </form>
                    </td>

 
            </tr>

            <% }%>
            <tr>
       
                    <td><form action="ProductsOwner.jsp" method="POST">
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
            try {
                // Registering Postgresql JDBC driver with the DriverManager
                Class.forName(DRIVER);

                // Open a connection to the database using DriverManager
                conn2 = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
            %>
            
            <%-- -------- Select Category Code -------- --%>
            <%

            String action = request.getParameter("action");
            if (action != null && action.equals("select")) 
            {
            	
            	Statement statement = conn2.createStatement();
            	
				// Use the created statement to SELECT
				// the student attributes FROM the Student table.
				rs3 = statement.executeQuery("SELECT name FROM categories");
				if(session.getAttribute("searchName") != null)
				{
					System.out.print("SELECT!!");
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
                		//pstmt2.setString(2, "%"+(String)session.getAttribute("searchName")+"%");
                		pstmt2 = conn2.prepareStatement("SELECT * FROM products where name LIKE ?");
                		pstmt2.setString(1, "%"+(String)session.getAttribute("searchName")+"%");
                		session.setAttribute("selectCategory",request.getParameter(null));
                	
                	}
				}
				else
				{	
					System.out.print("PURE SELECT!!");
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
           
            //search

            action = request.getParameter("action");
            if (action != null && action.equals("search")) 
            {
            	System.out.print("!!!!!");
            	session = request.getSession(true);
    			session.setAttribute("searchName",request.getParameter("keys")); 
                pstmt2 = conn2.prepareStatement("SELECT * FROM products WHERE name LIKE ? and category =?");
				//System.out.print(request.getParameter("name")+"!!!!");
				if((String)session.getAttribute("searcCategory") != null)
				{
					pstmt2.setString(1, "%"+(String)session.getAttribute("searchName")+"%");
					pstmt2.setString(2, (String)session.getAttribute("searcCategory"));
				}
				else
				{
					pstmt2 = conn2.prepareStatement("SELECT * FROM products WHERE name LIKE ?");
					pstmt2.setString(1, "%"+(String)session.getAttribute("searchName")+"%");
					
				}

                

                rs2 = pstmt2.executeQuery();
                System.out.print("go into search");
                Statement statement = conn2.createStatement();

				// Use the created statement to SELECT
				// the student attributes FROM the Student table.
				rs3 = statement.executeQuery("SELECT name FROM categories");
                
            }
            
 
            %>
            
               
            <%-- -------- UPDATE Code -------- --%>
            <%
                // Check if an update is requested
                if (action != null && action.equals("update")) {

                    // Begin transaction
                    conn2.setAutoCommit(false);

                    // Create the prepared statement and use it to
                    // UPDATE student values in the Students table.
                    pstmt2 = conn2.prepareStatement("UPDATE products SET name = ?,category = ?,sku = ?,price=? WHERE id = ?");
					//System.out.print("!!!!");
					//System.out.print(request.getParameter("id"));
                    pstmt2.setString(1, request.getParameter("name"));
                    pstmt2.setString(2, request.getParameter("category"));
                    pstmt2.setString(3, request.getParameter("sku"));
                    pstmt2.setFloat(4, Float.parseFloat(request.getParameter("price")));
                    pstmt2.setInt(5, Integer.parseInt(request.getParameter("id")));
                    //int rowCount = 
                    pstmt2.executeUpdate();

                    // Commit transaction
                    conn2.commit();
                    conn2.setAutoCommit(true);
                }
            %>
                    
                    <%-- -------- delete Code -------- --%>
            <%
                // Check if an update is requested
                if (action != null && action.equals("delete")) {
                	conn2.setAutoCommit(false);

                    // Create the prepared statement and use it to
                    // DELETE students FROM the Students table.
                    pstmt2 = conn2
                        .prepareStatement("DELETE FROM products WHERE id = ?");

                    pstmt2.setInt(1, Integer.parseInt(request.getParameter("id")));
                    //int rowCount = 
                    		pstmt2.executeUpdate();

                    // Commit transaction
                    conn2.commit();
                    conn2.setAutoCommit(true);
                }
            %>
            <!-- Add an HTML table header row to format the results -->
            <table border="1">
            table6
            <tr>
                <th>ID</th>
                <th>name</th>
                <th>category</th>
                <th>sku</th>
                <th>price</th>
            </tr>
  <%
                // Iterate over the ResultSet
                if (action != null && (action.equals("select")||action.equals("search"))) 
                {
                	//System.out.print("!!!!tabkeaakdfg!!");
                	while (rs2.next()) {
            %>
            <tr>
             <form action="ProductsOwner.jsp" method="POST">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="id" value="<%=rs2.getInt("id")%>"/>
                    <input type="hidden" name="category" value="<%=rs2.getString("category")%>"/>
      <%-- Get the id --%>
                <td>
                    <%=rs2.getInt("id")%>
                </td>

                <%-- Get the name --%>
                <td>
                    <input value="<%=rs2.getString("name")%>" name="name" size="15"/>
                </td>

 			<th><SELECT name="category" value="<%=rs2.getString("category")%>">
 			<option><%=rs2.getString("category")%>
            <%  
            	//System.out.print(rs3);
            	while(rs3.next())
                { 
            		if(!rs3.getString(1).equals(rs2.getString("category")))
            		{
            %>
            	<option><%= rs3.getString(1)%></option>
        	<% 
        			} 
            	}
        	 %>
        	 <%
        		 Statement statement = conn2.createStatement();

				// Use the created statement to SELECT
				// the student attributes FROM the Student table.
				rs3 = statement.executeQuery("SELECT name FROM categories");
        	 %>
				</SELECT></th>
       
                <td>
                    <input value="<%=rs2.getString("sku")%>" name="sku" size="15"/>
                </td>
                     <td>
                    <input value="<%=rs2.getString("price")%>" name="price" size="15"/>
                </td>
                  <%-- Button --%>
                <td><input type="submit" value="Update"></td>
                </form>
                
                 <form action="ProductsOwner.jsp" method="POST">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" value="<%=rs2.getInt("id")%>" name="id"/>
                    <input type="hidden" value="<%=rs2.getString("name")%>" name="name"/>
                    
                
                <%-- Button --%>
                
                
                <td><input type="submit" value="Delete"/></td>
                
                
                
            </tr>

            <% }}%>

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
            } catch (SQLException e) {

                // Wrap the SQL exception in a runtime exception to propagate
                // it upwards
                throw new RuntimeException(e);
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