<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<link href="style_ecab/stylebill.css" rel="stylesheet" type="text/css" />
<%
    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
    %>


  <%
   if(session.getAttribute("empid")==null)
   {
       response.sendRedirect("welcome_ecab.jsp");
   }
   
   %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Bookings</title>

<script type="text/javascript">
        function sizeshow() {
            var clientheight = document.documentElement.clientHeight;
            var clientwidth = document.documentElement.clientWidth;
          

            var setheight = parseInt(clientheight - 60 - 40 - 2);
            var setwidth = parseInt(clientwidth - 130  - 7);

            document.getElementById("content1").style.height = setheight + 'px';
            document.getElementById("contentmid").style.height = setheight + 'px';
            

            
            document.getElementById("contentmid").style.width = setwidth + 'px';
           

            return true;
        }
    </script>
</head>

<body onload=" return sizeshow();" onresize="return sizeshow();">

 <%!  String un1="", un2="", un3="" , un4="" , un5="", un6="",un7="",
         un8="", un9="" , un10="" , un11="", un12="", un13="" , un14="", un15="", un16="",un17="",un18=""  ;%>
   
<%@include file="header.jsp"%>
<%@include file="content_emp.jsp" %>

	<div id="contentmid" style="width:1200px;">
             <%        
                    
                    String name1=session.getAttribute("empid").toString();  
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking where driver_name =? AND Status=?";
                         
                         

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name1);  
                            myst.setString(2,"Active");
                            ResultSet myrs = myst.executeQuery();
                           
                            if(myrs.next())
                            {
                             
                            un1 = myrs.getString("user_name");
                            un2 = myrs.getString("veh_name");    
                            un3 = myrs.getString("veh_type");
                            un4 = myrs.getString("veh_regno");
                            un5 = myrs.getString("rate_km");
                            un9 = myrs.getString("pick_area");
                            un10 = myrs.getString("drop_area");
                            un11 = myrs.getString("pick_date");
                            un12= myrs.getString("pick_time");
                            un13 = myrs.getString("address");
                            un14 = myrs.getString("bill");
                            un15= myrs.getString("track_no");
                             un16= myrs.getString("dri_image");
                            un17=myrs.getString("gender");
                            un18=myrs.getString("driver_liceno");
                            }
                            else{
                              // response.sendRedirect("emp_home.jsp");
                               out.println( "<alert>No Booking Yet<alert>");
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
                    
                    
                    
                    
                       if(session.getAttribute("empid")!=null)
                    {
                     String name = request.getParameter("name");    
                     String path1= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon1;
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon1 = DriverManager.getConnection(path1,"root","");
                         String query1 ="select * from user where name=?";

                        try{
                          PreparedStatement myst1=mycon1.prepareStatement(query1);
                            myst1.setString(1,un1);          
                     ResultSet myrs1 = myst1.executeQuery();
                            if(myrs1.next())
                            {
                                
                            un6 = myrs1.getString("image");
                            un7 = myrs1.getString("gender");
                            un8 = myrs1.getString("mobile"); 
                            }
                            else{
                                out.println("<script> alert('Cab not Yet Booked !');</script>");
                            }
                        } catch (Exception e) {
                           out.println("Error due to"+e.getMessage());
                        }
                        finally
                        {
                            mycon1.close();
                        }
                    }
                    catch(Exception e)
                    {
                        out.println("Error in connection"+e.getMessage() );
                    }
                    
                    }
                                
                               %> 
                    
                    
                    
                              
        <form>
	<div id="z_phase0">
    <div>
    <div style="font-weight:bold; text-decoration:underline; color:#336699; font-size:25px; padding:20px 0 0 50px;">Booking:-</div>
    </div>
     <div style=" font-weight:bold; text-decoration:underline; color:#336699; font-size:20px;">Driver Details</div>
     </div>
	<div id="z_phase1">
      <table width="200" height="200" border="0" align="center" cellpadding="5" cellspacing="5">
        <tr>
          <td><img src="userimg/<% out.print(""+un6+""); %>" width="200" height="200"></td>
        </tr>
      </table>
    </div>
    
    <div id="z_phase2">
      <table width="500" height="200" border="0" cellpadding="4" cellspacing="4">
        <tr>
          <td width="141" style=" font-weight:bold; text-decoration:underline; color:#336699; font-size:20px;">Driver Details</td>
          <td width="6">&nbsp;</td>
          <td width="315">&nbsp;</td>
        </tr>
        <tr>
          <td class="t1">Name</td>
          <td class="t1">:</td>
          <td class="t2"><% out.print(""+un1+""); %></td>
        </tr>
        <tr>
          <td class="t1">Gender</td>
          <td class="t1">:</td>
          <td class="t2"><% out.print(""+un7+""); %></td>
        </tr>
        <tr>
         
        </tr>
        <tr>
          <td class="t1">Contact No</td>
          <td class="t1">:</td>
          <td class="t2"><% out.print(""+un8+""); %></td>
        </tr>
      </table>
    </div>
    
    <div id="z_phase3">
      <table width="1111" height="67" border="0" cellpadding="4" cellspacing="5">
        <tr>
          <td align="right" class="t1">Pickup Area:</td>
          <td class="t2"><% out.print(""+un9+""); %></td>
          <td align="right" class="t1">Drop Area:</td>
          <td class="t2"><% out.print(""+un10+""); %></td>
          <td align="right" class="t1">Date:</td>
          <td class="t2"><% out.print(""+un11+""); %></td>
           <td align="right" class="t1">Time:</td>
          <td class="t2"><% out.print(""+un12+""); %></td>
        </tr>
      </table>
    </div>
    
    <div id="z_phase4">
      <table width="1110" height="81" border="0" cellpadding="4" cellspacing="5">
        <tr>
          <td width="225" class="t1" align="right">Vehicle Name:</td>
          <td width="162" class="t2"><% out.print(""+un2+""); %></td>
          <td width="229" class="t1" align="right">Vehicle Type:</td>
          <td width="429" class="t2"><% out.print(""+un3+""); %></td>
        </tr>
        <tr>
          <td align="right" class="t1">Vehicle Register No:</td>
          <td class="t2"><% out.print(""+un4+""); %></td>
          <td align="right" class="t1">Rate/Km:</td>
          <td class="t2"><% out.print(""+un5+""); %></td>
        </tr>
      </table>
    </div>
    
    <div id="z_phase5">
      <table width="1000" border="0" cellspacing="4" cellpadding="5">
        <tr>
             <td width="225" align="right" class="t1">Pickup Address:</td>
          <td width="453" class="t2"><% out.print(""+un13+""); %></td>
          <td width="85" align="right" class="t1">Track No:</td>
          <td width="172" class="t2"><% out.print(""+un15+""); %></td>
        </tr>
        </table>
        <table width="1068" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td width="132" align="right" class="t1">Charges:</td>
          <td width="104" class="t2"><% out.print(""+un14+""); %></td>
          <td width="136" align="right" class="t1">Extra Km Travelled:</td>
          <td width="277" class="t2"><label for="ekm"></label>
          <input type="text" name="ekm" id="ekm"></td>
          <td width="118" align="right" class="t1">Waiting Charges:</td>
          <td width="245" class="t2"><label for="wcha"></label>
          <input type="text" name="wcha" id="wcha"></td>
        </tr>
        <tr>
          <td align="right" class="t1"></td>
          <td class="t2"></td>
          <td align="right" class="t1">&nbsp;</td>
          <td class="t2"></td>
          <td align="right" class="t1">&nbsp;</td>
          <td align="right" class="t2"><input type="submit" name="submit1" id="submit" value="Submit"
          style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"></td>
        </tr>
      </table>
    </div>
          
           <%    if(request.getParameter("submit1")!=null)
                            {
            int fi = Integer.parseInt(un5)* Integer.parseInt(request.getParameter("ekm"));    
            int se = Integer.parseInt(request.getParameter("wcha"));
            int th=Integer.parseInt(un14);
            String Total =String.valueOf(fi+se+th);    
           
           out.print(Total);
                 String path2= "jdbc:mysql://localhost:3306/ecab";
                Connection mycon2;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    mycon2 = DriverManager.getConnection(path,"root","");
                    String query2 ="update booking set bill=?,cash=?,Status=?  where track_no=?";
                    String query3 ="update cabs set Status=?  where vehiclename=?";
                    String query4 ="update driver set Status=?  where licence_no=?";
                    try{
                        PreparedStatement myst2=mycon2.prepareStatement(query2);
                         PreparedStatement myst3=mycon2.prepareStatement(query3);
                          PreparedStatement myst4=mycon2.prepareStatement(query4);
                          myst2.setString(1,Total);
                        myst2.setString(2,"Paid");
                        myst2.setString(3,"Non-Active");
                        myst2.setString(4,un15);
                         myst3.setString(1,"Non-Active");
                        myst3.setString(2,un2);
                         myst4.setString(1,"Non-Active");
                        myst4.setString(2,un18);
                        int i= myst2.executeUpdate();
                        
                        if(i>0)
                        {
                            
                                response.sendRedirect("emp_home.jsp");
                            out.println("<td><div style='clear:both; color:Green; font-size:12px;'>Details Updated</td>");
                        }
                        else{
                        
                            
                        }
                    } catch (Exception e) {
                       out.println("Error due to"+e.getMessage());
                    }
                    finally
                    {
                        mycon2.close();
                    }
                }
                catch(Exception e)
                {
                    out.println("Error in connection"+e.getMessage() );
                }       
}
     %>            
 </form>   
</div>   
 
<%@include file="emp_footer.jsp"%>
</body>

</html>