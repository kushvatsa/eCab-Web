<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<body>
<h1 style="color:#336699; font-size:26px;"><u>Track Booking Status:</u></h1>
     <form name="form1" method="post" action="">
       <table width="526" border="0" align="center" cellpadding="5" cellspacing="5">
         <tr>
           <td width="207" align="right" style="color:#336699; font-size:20px;">Enter Track Number:</td>
           <td width="284"><label for="trackno"></label>
           <input type="text" name="trackno" id="trackno" style="width:250px; height:30px; font-size:20px;"></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td align="right"><input type="submit" name="Cancel" id="Cancel" value="Confirm"
           style="color:#ffffff; background-color:#336699; width:100px; height:30px; font-size:15px; border-radius:7px;"></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td align="center" style="color:green; background-color:#D7D9D9; font-size:20px;"> 
               <%    if(request.getParameter("Cancel")!=null)
                    {
                    String name1=request.getParameter("trackno");  
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    
                    Connection mycon;
                   
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query3 ="Select * from  booking where track_no =?";
                        

                        try{
                            PreparedStatement myst3=mycon.prepareStatement(query3);
                            myst3.setString(1,name1);
                               ResultSet myrs=myst3.executeQuery();
                               if(myrs.next())
                               {
                                        if(myrs.getString("Status").equals("Active"))
                                        {
                                            out.println("<div style='color:green'>"+name1+" Active</div>");
                                        }else if(myrs.getString("Status").equals("Canceled"))
                                        {
                                            out.println("<div style='color:red'>"+name1+"Canceled</div> "); 
                                        }else
                                        {
                                            out.println("<div style='color:red'>"+name1+" Non-Active</div>"); 
                                        }
                           
                               }
                        } catch (Exception e) {
                           out.println("Error due to"+e.getMessage());
                        }
                        finally
                        {
                            mycon.close();
                        }
                    }
                    catch(Exception e)
                    {
                        out.println("Error in connection"+e.getMessage() );
                    }
                    
                    }
                               %> </td>
         </tr>
       </table>
     </form>
</body>

