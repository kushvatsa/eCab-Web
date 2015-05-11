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
   if(session.getAttribute("userid")==null)
   {
       response.sendRedirect("welcome_ecab.jsp");
   }
   
   %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Index</title>

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

     <%!  String un1="", un2="", un3="" , un4="" , un5="", un6="",un7="", un8="", un9="" , un10="" , un11="", un12="", un13="" , un14="", un15="", un16="",un17=""  ;%>
   
      <%        
                    if(session.getAttribute("userid")!=null)
                    {
                    String name1=session.getAttribute("track").toString();  
                   
                       
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    
                    Connection mycon;
                   
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking where track_no =?";
                         

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name1);          
                            ResultSet myrs = myst.executeQuery();
                            
                            if(myrs.next())
                            {
                             
                            un1 = myrs.getString("user_name");
                            un2 = myrs.getString("veh_name");    
                            un3 = myrs.getString("veh_type");
                            un4 = myrs.getString("veh_regno");
                            un5 = myrs.getString("rate_km");
                            un6= myrs.getString("driver_name");
                             un7 = myrs.getString("driver_liceno");
                            un8 = myrs.getString("driver_cont");    
                            un9 = myrs.getString("pick_area");
                            un10 = myrs.getString("drop_area");
                            un11 = myrs.getString("pick_date");
                            un12= myrs.getString("pick_time");
                            un13 = myrs.getString("address");
                            un14 = myrs.getString("bill");
                            un15= myrs.getString("track_no");
                             un16= myrs.getString("dri_image");
                            un17=myrs.getString("gender");
                            }
                            else{
                                
                               out.println("</div>" +
                            "<tr><td><div style='clear:both; margin-left:5px; color:Red;'>Cab not Yet Booked !</div></td></tr>");
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
<%@include file="header.jsp"%>
<%@include file="contentusr1.jsp" %>
    <div id="contentmid" style="width:1200px;">
<form>
	<div id="z_phase0">
    <div style="font-weight:bold; text-decoration:underline; color:#336699; font-size:25px; padding:20px 0 0 50px;">Bill:-</div>
    </div>
	<div id="z_phase1">
      <table width="200" height="200" border="0" align="center" cellpadding="5" cellspacing="5">
        <tr>
          <td><img src="driverimg/<% out.print(""+un16+"");%>" width="200" height="200"></td>
        </tr>
      </table>
    </div>
    
    <div id="z_phase2">
      <table width="500" height="200" border="0" cellpadding="5" cellspacing="5">
        <tr>
          <td width="135" style=" font-weight:bold; text-decoration:underline; color:#336699; font-size:20px;">Driver Details</td>
          <td width="8">&nbsp;</td>
          <td width="310">&nbsp;</td>
        </tr>
        <tr>
          <td class="t1">Name</td>
          <td class="t1">:</td>
          <td class="t2"><% out.print(""+un6+"");%></td>
        </tr>
        <tr>
          <td class="t1">Gender</td>
          <td class="t1">:</td>
          <td class="t2"><% out.print(""+un17+"");%></td>
        </tr>
        <tr>
          <td class="t1">Licence No</td>
          <td class="t1">:</td>
          <td class="t2"><% out.print(""+un7+"");%></td>
        </tr>
        <tr>
          <td class="t1">Contact No</td>
          <td class="t1">:</td>
          <td class="t2"><% out.print(""+un8+"");%></td>
        </tr>
      </table>
    </div>
    
    <div id="z_phase3">
      <table width="1111" height="67" border="0" cellpadding="5" cellspacing="5">
        <tr>
          <td align="right" class="t1">Pickup Area:</td>
          <td class="t2"><% out.print(""+un9+"");%></td>
          <td align="right" class="t1">Drop Area:</td>
          <td class="t2"><% out.print(""+un10+"");%></td>
          <td align="right" class="t1">Date:</td>
          <td class="t2"><% out.print(""+un11+"");%></td>
           <td align="right" class="t1">Time:</td>
          <td class="t2"><% out.print(""+un12+"");%></td>
        </tr>
      </table>
    </div>
    
    <div id="z_phase4">
      <table width="1110" height="81" border="0" cellpadding="5" cellspacing="5">
        <tr>
          <td width="225" class="t1" align="right">Vehicle Name:</td>
          <td width="162" class="t2"><% out.print(""+un2+"");%></td>
          <td width="229" class="t1" align="right">Vehicle Type:</td>
          <td width="429" class="t2"><% out.print(""+un3+"");%></td>
        </tr>
        <tr>
          <td align="right" class="t1">Vehicle Register No:</td>
          <td class="t2"><% out.print(""+un4+"");%></td>
          <td align="right" class="t1">Rate/Km:</td>
          <td class="t2"><% out.print(""+un5+"");%></td>
        </tr>
      </table>
    </div>
    
    <div id="z_phase5">
      <table width="1108" border="0" cellspacing="5" cellpadding="5">
        <tr>
             <td width="151" align="right" class="t1">Pickup Address:</td>
          <td width="175" class="t2"><% out.print(""+un13+"");%></td>
          <td width="98" align="right" class="t1">Track No:</td>
          <td width="148" class="t2"><% out.print(""+un15+"");%></td>
          <td width="94" align="right" class="t1">Charges:</td>
          <td width="153" class="t2"><% out.print(""+un14+"");%>/-</td>
          <td width="179" class="t2"><input type="submit" name="dbook" id="dbook" value="Delete Booking"
          style="color:#ffffff; background-color:#336699; width:120px; height:30px; border-radius:7px;"></td>
        </tr>
      </table>
    </div>
 </form>   
</div>  
 
<%@include file="usr_footer.jsp"%>
</body>

</html>