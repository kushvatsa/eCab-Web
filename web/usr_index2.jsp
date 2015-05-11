<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.io.*,java.sql.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Index</title>
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
		
		function validate()
{
	var addr = document.getElementById('addr').value.trim();
	
	if (addr == "" || addr== null) 
	{
                alert("Enter Address");
				return false;
        }
	
	
}
    </script>
</head>

<body onload=" return sizeshow();" onresize="return sizeshow();">

    <%! ResultSet myrs;
    String un1;%>
  <%@include file="header.jsp"%>
  <%@include file="contentusr1.jsp"%>
    <div id="contentmid">
     <%                 
   
                                
                                 Random rand = new Random();
                                 int n = (rand.nextInt(90000) + 10000);
                                 String track=String.valueOf(n);
                                  session.setAttribute("track",track);  
                   
                try{
                        String name=session.getAttribute("userid").toString();
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from user where name=?";
                      PreparedStatement myst=mycon.prepareStatement(query);
                       myst.setString(1,name);
                      myrs = myst.executeQuery();
                        
                               if(myrs.next())
                            {
                               un1 = myrs.getString("addr");
                            }
                    }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %> 
     <div id="sub_menu"><u>Pickup Address:</u></div>
     <form name="form1" method="post" action="">
       <table width="700" height="272" border="0" cellpadding="5" cellspacing="5" class="t1">
         <tr>
           <td width="242" height="175" align="right" valign="top">Address:</td>
           <td width="423" valign="top"><label for="addr"></label>      <textarea name="addr" cols="50" rows="10" id="addr"> <% out.print(""+un1+"");%></textarea><label for="parea"></label></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td align="right"><input type="submit" name="Submit1" onclick="return validate()" id="submit" value="Confirm Booking"
           style="color:#ffffff; background-color:#336699; width:200px; height:40px; font-size:20px; border-radius:7px;"></td>
         </tr>
       </table>
     </form>
        <%          
                     if(request.getParameter("Submit1")!=null)
                            {
                                
                           String drilic=session.getAttribute("d_lice").toString();
                           String dricont=session.getAttribute("d_conta").toString();
                           String drina=session.getAttribute("d_name").toString();
                             String drigen=session.getAttribute("d_gender").toString();
                            String driimag=session.getAttribute("d_image").toString();
                           String vetpe=session.getAttribute("v_type").toString();
                           String vreg=session.getAttribute("v_regno").toString();
                           String vrate=session.getAttribute("v_rate").toString();
                           String bill=session.getAttribute("bill").toString();  
                         String userid = session.getAttribute("userid").toString();    
                         String pickarea = session.getAttribute("parea").toString();
                         String droparea = session.getAttribute("darea").toString();
                         String pickdate = session.getAttribute("pdate").toString();
                         String picktime = session.getAttribute("ptime").toString();
                         String vename = session.getAttribute("v_name").toString();
                         String address =request.getParameter("addr");
                          String usrimg = session.getAttribute("usrimg").toString();
                         String drouteid= session.getAttribute("drouteid").toString();
                          String vrid= session.getAttribute("v_rid").toString();
                          String unemail= session.getAttribute("email").toString();
                             String path= "jdbc:mysql://localhost:3306/ecab";
                             Connection mycon;

                             try {
                                 Class.forName("com.mysql.jdbc.Driver");
                                 mycon = DriverManager.getConnection(path,"root","");
                                 String query ="insert into booking values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                                  String query3 ="insert into cabstatus values(?,?,?)";
                                   String query1 ="insert into driverstatus values(?,?,?)";
                                   
                                     PreparedStatement myst=mycon.prepareStatement(query);
                                     PreparedStatement myst1=mycon.prepareStatement(query1);
                                     PreparedStatement myst3=mycon.prepareStatement(query3);    
                                 try{
                                    
                                     myst.setString(1,userid);
                                     myst.setString(2,vename);
                                      myst.setString(3,vetpe);
                                       myst.setString(4,vreg);
                                        myst.setString(5,vrate);
                                        myst.setString(6,drina);
                                       
                                         myst.setString(7,drouteid);
                                          myst.setString(8,drigen);
                                         myst.setString(9,drilic);
                                          myst.setString(10,dricont);
                                     myst.setString(11,pickarea);
                                     myst.setString(12,droparea);
                                     
                           String dateReceived =pickdate;
                        DateFormat userDateFormat = new SimpleDateFormat("yyyy-mm-dd");
                        DateFormat dateFormatNeeded = new SimpleDateFormat("dd-mm-yyyy");
                        java.util.Date date = userDateFormat.parse(dateReceived);
                        String cd = dateFormatNeeded.format(date);
                            
                                     myst.setString(13,cd);
                                     myst.setString(14,picktime);
                                     myst.setString(15,address);
                                      myst.setString(16,bill);
                                       myst.setString(17,track);
                                        myst.setString(18,driimag);
                                         myst.setString(19,"Active");
                                          myst.setString(20,"Not-Paid");
                                            myst.setString(21,usrimg);
                                             myst.setString(22,vrid);
                                             myst.setString(23,unemail);
                                             
                                           myst1.setString(1,drouteid);
                                       myst1.setString(2,cd);
                                        myst1.setString(3,"Active");
                                        
                                         myst3.setString(1,vrid);
                                       myst3.setString(2,cd);  
                                        myst3.setString(3,"Active");  
                                         
                                     int i= myst.executeUpdate();
                                     int j= myst1.executeUpdate();
                                     int k= myst3.executeUpdate();
                                     if(i>0 && j>0 && k>0)
                                     {
                                         response.sendRedirect("usr_bill.jsp");
                                         out.print("<p style='color:Red'>Cab Booked !<p>");
                                     }
                                     else{
                                     out.print("<p style='color:Red'>Cab not Booked !<p>");
                                     }
                                 } catch (Exception e) {
                                    e.printStackTrace();
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
  <div style="clear:both; height:150px; width:1000px;">
     <div style=" clear:both; margin-left:120px; background-color:#E4E8EB; height:180px; width:850px; border-radius:5px;">
         <p> 
             <strong><u>Note</u> :</strong>
         </p>
         <ul>
             <li>Fill up Pickup Address in above Box and Press Confirm Booking.</li>
             <h4><u>Cancellation and Returns</u></h4>
                
             <li>You may cancel the booking 24 hour prior to the time of journey, without any cancellation charges for all services. Otherwise cancellation charges will be according to Company Rules. </li>
         </ul>
     </div>
 	</div>
    </div>
 
<%@include file="usr_footer.jsp"%>
</body>

</html>