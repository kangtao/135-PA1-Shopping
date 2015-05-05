<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Categories</title>
</head>
<body>
Hello <%=(String)session.getAttribute("currentSessionUserName")%></br>
<% if((String)session.getAttribute("currentSessionUserName") == null)
	{
		response.sendRedirect("NoUser.jsp");
	}
	else
	{
		String userRole= (String)session.getAttribute("currentSessionUserRole");
		if(!userRole.equals("owner"))
			out.print("This page is available to owners only");
		else
		{
%>
Categories</br>
<% 			if((String)session.getAttribute("modificationFailure") == "true")
			{
				out.print("data modification failure");
				session = request.getSession(true);
				session.setAttribute("modificationFailure","false"); 	
			}
%>

<table>
    <tr>
        <td>
            <%-- Import the java.sql package --%>
            <%@ page import="java.sql.*"
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
            
            <%-- -------- INSERT Code -------- --%>
            <%
              		String action = request.getParameter("action");
                	// Check if an insertion is requested
                	if (action != null && action.equals("insert")) 
                	{

                    	// Begin transaction
                    	conn.setAutoCommit(false);

                    	// Create the prepared statement and use it to
                    	// INSERT student values INTO the students table.
                    	pstmt = conn.prepareStatement("INSERT INTO categories (name, description) VALUES (?, ?)");

                    	pstmt.setString(1, request.getParameter("name"));
                    	pstmt.setString(2, request.getParameter("description"));

                    	pstmt.executeUpdate();

                    	// Commit transaction
                    	conn.commit();
                    	conn.setAutoCommit(true);
                	}
                
            %>
            
            <%-- -------- UPDATE Code -------- --%>
            <%
            		// Check if an update is requested
                	if (action != null && action.equals("update")) 
                	{

                    	// Begin transaction
                    	conn.setAutoCommit(false);

                    	// Create the prepared statement and use it to
                    	// UPDATE student values in the Students table.
                    	pstmt = conn.prepareStatement("UPDATE categories SET name = ?, description = ? WHERE id = ?");
                    	pstmt.setString(1, request.getParameter("name"));
                    	pstmt.setString(2, request.getParameter("description"));
                    	pstmt.setInt(3, Integer.parseInt(request.getParameter("id")));
                   		pstmt.executeUpdate();

                    	// Commit transaction
                    	conn.commit();
                    	conn.setAutoCommit(true);
                	}
            %>
            
            <%-- -------- DELETE Code -------- --%>
            <%
                	// Check if a delete is requested
                	if (action != null && action.equals("delete")) 
                	{
						Connection conn3 = null;
	           			PreparedStatement pstmt3 = null;
	            		ResultSet rs3 = null;
	            		Statement statement3 = null; 
	            		int c = 0;
	            		try 
	            		{
	                		// Registering Postgresql JDBC driver with the DriverManager
	                		Class.forName(DRIVER);
	                		conn3 = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
							pstmt3 = conn.prepareStatement("SELECT COUNT(*) as count FROM products where category = ?");
                    		pstmt3.setString(1, request.getParameter("name"));
                    	
                    		rs3 = pstmt3.executeQuery();
                    		while(rs3.next())
                    		{
                    			//System.out.print(rs3.getString("count"));
                    			c = Integer.parseInt(rs3.getString("count"));
                    		}
                    		
                    		if(c != 0)
							{
                    	    	session = request.getSession(true);
             	    			session.setAttribute("modificationFailure","true"); 
             	    			//  not deletable
                         		response.sendRedirect("Categories.jsp");
							}
     
	            		}
	            		finally
	            		{
	            		
	            			if(rs3 != null  && conn3 != null)
	                		{
	                    		// Close the ResultSet
	                    		rs3.close();
	                    		conn3.close();
	                		}
	            		}
	            	

                    	// Begin transaction
                    	conn.setAutoCommit(false);

                    	// Create the prepared statement and use it to
                    	// DELETE students FROM the Students table.
                    	pstmt = conn.prepareStatement("DELETE FROM categories WHERE id = ?");

                    	pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
                    	pstmt.executeUpdate();

                    	// Commit transaction
                    	conn.commit();
                    	conn.setAutoCommit(true);
                	}
            %>

            <%-- -------- SELECT Statement Code -------- --%>
            <%
                	// Create the statement
                	Statement statement = conn.createStatement();

                	// Use the created statement to SELECT
                	// the student attributes FROM the Student table.
                	rs = statement.executeQuery("SELECT * FROM categories");
            %>
            
            <!-- Add an HTML table header row to format the results -->
            <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
            </tr>

            <tr>
                <form action="Categories.jsp" method="POST">
                    <input type="hidden" name="action" value="insert"/>
                    <th>&nbsp;</th>
                    <th><input value="" name="name" size="15"/></th>
                    <th><input value="" name="description" size="15"/></th>
                    <th><input type="submit" value="Insert"/></th>
                </form>
            </tr>

            <%-- -------- Iteration Code -------- --%>
            <%
                // Iterate over the ResultSet
                while (rs.next()) 
                {
            %>

            <tr>
                <form action="Categories.jsp" method="POST">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>

                <%-- Get the id --%>
                <td>
                    <%=rs.getInt("id")%>
                </td>

                <%-- Get the name --%>
                <td>
                    <input value="<%=rs.getString("name")%>" name="name" size="15"/>
                </td>

                <%-- Get the first name --%>
                <td>
                    <input value="<%=rs.getString("description")%>" name="description" size="15"/>
                </td>
               <%-- Button --%>
                <td><input type="submit" value="Update"></td>
                </form>
		
				<%
					Connection conn2 = null;
	           		PreparedStatement pstmt2 = null;
	            	ResultSet rs2 = null;
	            	Statement statement2 = null; 
	            	int c = 0;
	            	try 
	            	{
	                	// Registering Postgresql JDBC driver with the DriverManager
	                	Class.forName(DRIVER);
	                	conn2 = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
						pstmt2 = conn.prepareStatement("SELECT COUNT(*) as count FROM products where category = ?");
                    	pstmt2.setString(1, rs.getString("name"));

                    	rs2 = pstmt2.executeQuery();
                    	while(rs2.next())
                    	{
                    		//System.out.print(rs2.getString("count"));
                    		c = Integer.parseInt(rs2.getString("count")); // check something in this category or not
                    	}
                    		
                    	if(c == 0)
						{
					
					
				%>
 
                
                <form action="Categories.jsp" method="POST">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" value="<%=rs.getInt("id")%>" name="id"/>
                    <input type="hidden" value="<%=rs.getString("name")%>" name="name"/>
                
                <%-- Button --%>
                
                
                <td><input type="submit" value="Delete"/></td>
                <%
                		}
                %>
                </form>
            </tr>

            <%
            			if(rs2 != null  && conn2 != null)
        				{
            				// Close the ResultSet
            				rs2.close();
            				conn2.close();
        				}
            		}
       				catch (SQLException e) 
	         		{

            			// Wrap the SQL exception in a runtime exception to propagate it upwards
            			throw new RuntimeException(e);
        			}
                }
            %>

            <%-- -------- Close Connection Code -------- --%>
            <%
                // Close the ResultSet
                rs.close();

                // Close the Statement
                statement.close();

                // Close the Connection
                conn.close();
            } 
            catch (SQLException e) 
            {
				
                // Wrap the SQL exception in a runtime exception to propagate
                // it upwards
                if((String)session.getAttribute("modificationFailure") != "true")
                {
                	session = request.getSession(true);
	    			session.setAttribute("modificationFailure","true"); 
            		response.sendRedirect("Categories.jsp");
                }
                
            }
            
            finally 
            {
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
		}// else for owners
	} //else for users
            %>
        </table>
        </td>
    </tr>
</table>
</br>
<a href="Home.jsp">Back to home</a>
</body>

</html>
