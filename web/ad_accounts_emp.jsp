<%@page import="java.sql.*"%>
<h1 style="color:#336699; font-size:26px;"><u>Employee Account:</u></h1>
<form name="form1" method="post" action="" onsubmit="parent.$.fancybox.close(); " target="_parent">
  <table width="500" border="0" align="center" cellpadding="5" cellspacing="5" style="color:#336699; font-size:20px;">
      <%! ResultSet myrs13; String prev=""; %>
      <%
       
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from driver ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                      myrs13 = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }   
          %>
    <tr>
      <td>Select Employee:</td>
      <td><label for="semp"></label>
        <select name="semp" id="semp" style="height:30px; width:250px; font-size:20px;">
          <option value="select" selected>Select</option>
             <% if(myrs13.next())
             { 
                 do
                 {
                    
                         out.println("<option value='"+myrs13.getString("driver_id")+"'>"+myrs13.getString("name")+"</option>");
                     
                 }while(myrs13.next());
                 
             }   
                 %>
      </select></td>
    </tr>
     <%
       
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from driver where driver_id=?";
                      PreparedStatement myst=mycon.prepareStatement(query);
                        myst.setString(1,request.getParameter("semp"));
                    ResultSet myrs14 = myst.executeQuery();
                     if(myrs14.next())
                       {
                           prev=myrs14.getString("allowances");
                       }
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }   
          %>
    <tr>
        
      <td>Bonus:</td>
      <td><label for="bonus"></label>
          <input type="text" name="bonus" id="bonus" style="height:30px; width:250px; font-size:20px;" value="0" /></td>
    </tr>
    <tr>
      <td>Medial Fee:</td>
      <td><label for="mfee"></label>
      <input type="text" name="mfee" id="mfee" style="height:30px; width:250px; font-size:20px;" value="0"/></td>
    </tr>
    <tr>
      <td>Other Allowances:</td>
      <td><label for="odr"></label>
      <input type="text" name="odr" id="odr" style="height:30px; width:250px; font-size:20px;" value="0"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td align="right">
      <input type="submit" name="Submite" id="Submite" value="Submit"
      style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"/></td>
    </tr>
    <%
                            if(request.getParameter("Submite")!=null)
                                                {
                                                    int pr1=Integer.parseInt(prev);
                                                    int fc1 =Integer.parseInt(request.getParameter("bonus"));
                                                     int rp1 =Integer.parseInt(request.getParameter("mfee"));
                                                      int od1 =Integer.parseInt(request.getParameter("odr"));
                                                    int c1= pr1+fc1+rp1+od1;
                                                   
                                                    String path= "jdbc:mysql://localhost:3306/ecab";
                                                    Connection mycon;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        mycon = DriverManager.getConnection(path,"root","");
                                                        String query ="update driver set allowances=? where driver_id=?";


                                                        try{
                                                            PreparedStatement myst=mycon.prepareStatement(query);
                                                            myst.setString(1,String.valueOf(c1));
                                                            myst.setString(2,request.getParameter("semp"));
                                                            
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