<%@page import="java.sql.*"%>
<%
    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
    %>


  <%
   if(request.getParameter("email")==null)
   {
       response.sendRedirect("welcome_ecab.jsp");
   }
   
   %>
<%
try
        {
            
            Class.forName("com.mysql.jdbc.Driver"); //driver communication

            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecab","root","");
            try
            {
                    String b="update allusers set authenticate=? where email=?";

                    PreparedStatement mystatement=con.prepareStatement(b);

                    mystatement.setString(1, "Yes");
                    mystatement.setString(2, request.getParameter("email"));
                  
                    int x=mystatement.executeUpdate();
                    if(x==1)
                        {
                              //  session.setAttribute("uname", request.getParameter("name"));
                                response.sendRedirect("welcome_ecab.jsp?msg3=true");
                        }

            }
            catch(Exception e)
            {
                out.println("Query error" + e.getMessage());
                e.printStackTrace();
            }
               con.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            out.println("Connection error" + e.getMessage());
        }
%>