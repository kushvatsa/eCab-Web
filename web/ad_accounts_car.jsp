<%@page import="java.sql.*"%>
<h1 style="color:#336699; font-size:26px;"><u>Car Account:</u></h1>
<form name="form2" method="post" action=""  target="_parent">
  <table width="500" border="0" align="center" cellpadding="5" cellspacing="5" style="color:#336699; font-size:20px;">
      <%! ResultSet myrs11;String pre=""; %>
      <%        
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from cabs ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                        myrs11 = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %> 
    <tr>
      <td>Select Car:</td>
      <td><label for="scar"></label>
        <select name="scar" id="scar" style="height:30px; width:250px; font-size:20px;">
       <option value="select" selected>Select</option>
                 <% if(myrs11.next())
             { 
                 do
                 {
                    
                         out.println("<option value='"+myrs11.getString("cab_id")+"'>"+myrs11.getString("vehiclename")+"</option>");
                  
                 }while(myrs11.next());
                 
             }   
                 %>
                 
                 </select>    
      </td>
    </tr>
     <%        
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from cabs where cab_id=?";
                      PreparedStatement myst=mycon.prepareStatement(query);
                       myst.setString(1,request.getParameter("scar"));
                       ResultSet myrs12 = myst.executeQuery();
                       if(myrs12.next())
                       {
                           pre=myrs12.getString("Charges");
                       }
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %> 
    <tr>
      <td>Fuel Charges:</td>
      <td>
          <input name="fcharge" type="text" id="fcharge" style="height:30px; width:250px; font-size:20px;" value="0"/></td>
    </tr>
    <tr>
      <td>Repair Charges:</td>
      <td><label for="repair"></label>
      <input type="text" name="repair" id="repair" style="height:30px; width:250px; font-size:20px;" value="0"/></td>
    </tr>
    <tr>
      <td>Other Charges:</td>
      <td><label for="odr"></label>
      <input type="text" name="odr" id="odr" style="height:30px; width:250px; font-size:20px;" value="0"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td align="right">
      <input type="submit" name="Submitc" id="Submitc" value="Submit"
      style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"/></td>
    </tr>
    <%        
                 
                  if(request.getParameter("Submitc")!=null)
                                                {
                                                    int pr=Integer.parseInt(pre);
                                                    int fc =Integer.parseInt(request.getParameter("fcharge"));
                                                     int rp =Integer.parseInt(request.getParameter("repair"));
                                                      int od =Integer.parseInt(request.getParameter("odr"));
                                                    int c= pr+fc+rp+od;
                                                   
                                                    String path= "jdbc:mysql://localhost:3306/ecab";
                                                    Connection mycon;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        mycon = DriverManager.getConnection(path,"root","");
                                                        String query ="update cabs set Charges=? where cab_id=?";


                                                        try{
                                                            PreparedStatement myst=mycon.prepareStatement(query);
                                                            myst.setString(1,String.valueOf(c));
                                                            myst.setString(2,request.getParameter("scar"));
                                                            
                                                            int i= myst.executeUpdate();

                                                            if(i>0)
                                                            {
                                                              response.sendRedirect("ad_accounts.jsp?msg0=true");
                                                            }
                                                            else{
                                                                response.sendRedirect("ad_accounts.jsp?msg01=true");
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
                 
                 %>
  </table>
</form>