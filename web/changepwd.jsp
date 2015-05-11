		<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
                <script type="text/javascript">

        function valid()
        {
             var email = document.getElementById('eid').value.trim();
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (email == "" || email == null) 
                        {
                        alert("Enter Email");
                                return false;
                             }

                        else if (!email.match(mailformat)) 
                        {
                      alert("Enter Valid Email Address");
                          return false;    
                    }
        }
    </script>
        <h1 style="color:#336699; font-size:26px;"><u>Enter Email id:</u></h1>
        <form name="form1" method="post" action="" >
	    <table width="368" height="136" border="0" align="center" cellpadding="5" cellspacing="5" style="font-size:20px;">
	      <tr>
	        <td align="right" style="color:#336699;">Email id:</td>
	        <td><label for="eid"></label>
            <input type="text" name="eid" id="eid" style="height:30px; width:250px; font-size:20px;"></td>
          </tr>
	      <tr>
	        <td align="right">&nbsp;</td>
	        <td align="right"><input type="submit" name="Submit" id="Submit" value="Submit" onclick="return valid()"
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"></td>
          </tr>
        </table>
            <%  if(request.getParameter("Submit")!=null)
                        {
    
                       String mail1 = request.getParameter("eid");  
                 String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            mycon = DriverManager.getConnection(path,"root","");
          
            String query ="select * from allusers where email=?";
           
            try{
                
                PreparedStatement myst=mycon.prepareStatement(query);
               
                  myst.setString(1,mail1);
                
                 ResultSet myrs = myst.executeQuery();
                if(myrs.next())
                {    
                    
                    //String mail1 =myrs.getString("email");
                    
                    if(myrs.getString("typeid").equals("User"))
                    {
                        session.setAttribute("email1",mail1);
                        response.sendRedirect("changepwd1.jsp");
                     }
                
                    else if(myrs.getString("typeid").equals("Admin"))
                    {
                        
                    session.setAttribute("email1",mail1);
                    response.sendRedirect("changepwd5.jsp");
                    
                    }
                     else if(myrs.getString("typeid").equals("Driver"))
                    {
                       
                    session.setAttribute("email1",mail1);
                    response.sendRedirect("changepwd5.jsp");
                    
                    }
                }
                else{
                out.print("<p style='color:Red'>Invalid Email<p>");
                   }
                
            }
             catch (Exception e) {
               out.print("<p style='color:Red'>" +"Primary Key Already Taken" + "</p>");
            }
            finally
            {
                mycon.close();
            }
        }
        catch(Exception e)
        {
            out.print("Error in connection"+e.getMessage() );
                    }
                }  
    %>
      </form>