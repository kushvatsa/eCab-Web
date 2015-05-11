<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cancel Booking</title>
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
<script language="javascript" type="text/javascript">
	function dothat()
	{
		var x = confirm("Are you sure you want to cancel it?");
		  if (x)
		  {
			  return true;
		  }
		  else
		  {
			return false;
		  }
	}
</script>

<script type="text/javascript">
        function sizeshow() {
            var clientheight = document.documentElement.clientHeight;
            var clientwidth = document.documentElement.clientWidth;
          

            var setheight = parseInt(clientheight - 60 - 40 - 2);
            var setwidth = parseInt(clientwidth - 130 - 170 - 7);

            document.getElementById("content1").style.height = setheight + 'px';
            document.getElementById("contentmid").style.height = setheight + 'px';
            document.getElementById("content2").style.height = setheight + 'px';

            
            document.getElementById("contentmid").style.width = setwidth + 'px';
           

            return true;
        }
    </script>
</head>

<body onload=" return sizeshow();" onresize="return sizeshow();">

   
  <%@include file="header.jsp"%>
  <%@include file="content_emp.jsp" %>
  <%! ResultSet myrs11;%>
    <div id="contentmid">
          <%        
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking where Status='Active' and driver_name=? ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                        myst.setString(1,session.getAttribute("empid").toString()); 
                         myrs11 = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %> 
     <div id="sub_menu"><u>Cancel Booking:</u></div>
     <form name="form1" method="post" action="">
       <table width="526" border="0" cellspacing="5" cellpadding="5">
         <tr>
           <td width="207" align="right">Enter Track Number:</td>
           <td width="284"><label for="trackno"></label>
            <select name="trackno" id="trackno">
             <option value="select" selected>Select</option>
                 <% if(myrs11.next())
             { 
                 do
                 {
                    
                         out.println("<option>"+myrs11.getString("track_no")+"</option>");
                     
                 }while(myrs11.next());
                 
             }   
                 %>
                 
                 </select></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td align="right"><input type="submit" name="Cancel" id="Cancel" value="Confirm" onclick=" return dothat();"
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
                                   String un4=myrs.getString("cab_id");
                                   String un7=myrs.getString("driver_id");
                                     String un8=myrs.getString("pick_date");
                                    String query ="update booking set Status=? where track_no =?";
                          String query1 ="update cabstatus set Status=? where cab_id =? and date=? ";
                          String query2 ="update driverstatus set Status=? where driver_id =? and date=?";
                              PreparedStatement myst=mycon.prepareStatement(query);
                            PreparedStatement myst1=mycon.prepareStatement(query1);
                             PreparedStatement myst2=mycon.prepareStatement(query2);
                            myst.setString(1,"Canceled");  
                             myst.setString(2,name1);  
                            myst1.setString(1,"Non-Active");  
                             myst1.setString(2,un4);
                              myst1.setString(3,un8);  
                              myst2.setString(1,"Non-Active");  
                             myst2.setString(2,un7);  
                               myst2.setString(3,un8);
                             int i= myst.executeUpdate();
                              int j= myst1.executeUpdate();
                               int k= myst2.executeUpdate();
                            if(i>0 && j>0&& k>0)
                            {
                            // response.sendRedirect("usr_cancelbook.jsp");
                            out.println(name1+" Booking Canceled");
                            }
                            else{
                                
                               out.println("</div>" +
                            "<tr><td><div style='clear:both; margin-left:5px; color:Red;'>Cab not Canceled !</div></td></tr>");
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
      
    </div>
   
    <div id="content2">
        
    </div>
    
  <%@include file="emp_footer.jsp" %>

</body>

</html>