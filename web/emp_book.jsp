<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/script_on.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="style_ecab/jquery-ui.structure.css"/>
<link rel="stylesheet" type="text/css" href="style_ecab/jquery-ui.theme.css"/>
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
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
        function PrintDiv() { 
            document.getElementById('pp').style.visibility="hidden";
			document.getElementById('print').style.visibility="hidden";
           var divToPrint = document.getElementById('contentmid');
           var popupWin = window.open('', '_blank', 'width=1100,height=600');
           popupWin.document.open();
           popupWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</html>');
            popupWin.document.close();
			document.getElementById('pp').style.visibility="visible";
			document.getElementById('print').style.visibility="visible";
                }
     </script>
<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>
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

<body onload=" return sizeshow();" onresize="return sizeshow();" style="background-color: #E4E8EB;">

 <%!  String un1="", un2="", un3="" , un4="" , un5="", un6="",un7="",
         un8="", un9="" , un10="" , un11="", un12="", un13="" , un14="", un15="", un16="",un17="",
        un18="" ,un19="",un20="", unew="",unema=""  ;%>
   
<%@include file="header.jsp"%>
<%@include file="content_emp.jsp" %>

	<div style="overflow:auto; height:auto; width:auto;">
    <form>
    <div id="tabs">
        <div id="contentmid" style="width:1100px; background-color: #FFFFFF;">
            <ul id="pp">
                <% 
                
                   String name1=session.getAttribute("empid1").toString();  
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking where driver_id =? AND Status=?";
                         
                         

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name1);  
                            myst.setString(2,"Active");
                            ResultSet myrs = myst.executeQuery();
                           
                            if(myrs.next())
                            {
                            int x=1;
                            do{
                            unew = myrs.getString("user_name");
                            unema= myrs.getString("user_email");
                                out.println(" <li><a href='#tabs-"+x+"'>"
                                        +"Track No:"+myrs.getString("track_no")
                                                +"</a></li>");
                                
                                 x++;
                            }
                            while(myrs.next());
                            out.println("</ul>");
                            }
                            else{
                                
                               
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
                    %>
                    
                    <%
                         if(session.getAttribute("empid")!=null)
                    {
                     String name = request.getParameter("name");    
                     String path1= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon1;
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon1 = DriverManager.getConnection(path1,"root","");
                         

                        try{
                          String query1 ="select * from user where email=?";
                          PreparedStatement myst1=mycon1.prepareStatement(query1);
                          myst1.setString(1,unema);
                          
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
   

                               
                               <%
                    
                    
                        String name2=session.getAttribute("empid1").toString();  
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking where driver_id =? AND Status=?";
                         
                         

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name2);  
                            myst.setString(2,"Active");
                            ResultSet myrs = myst.executeQuery();
                           
                            if(myrs.next())
                            {
                            int x=1;
                            do{
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
                            un19=myrs.getString("driver_id"); 
                           un20=myrs.getString("cab_id"); 
                            
                               out.print("<div id='tabs-" + x + "'>" +
                                "<div id='z_phase0'>" +
    "<div style='font-weight:bold; text-decoration:underline; color:#336699; font-size:25px; padding:0px 0 0 50px;'>Bill:-"+
    "<div style=' padding-right:50px;float:right; font-size:15px;'>" +
    "<input name='print' id='print' type='button' value='Print' onclick='PrintDiv();'> " +
    "</div></div>" +
    
                                       
        "</div>" +
	"<div id='z_phase1'>" +
      "<table width='200' height='200' border='0' align='center' cellpadding='5' cellspacing='5'>" +
        "<tr>" +
          "<td><img src='userimg/"+un6+"'"+ 
            "width='200' height='200'></td>" +
        "</tr></table></div>" +
     
    "<div id='z_phase2'>"+
      "<table width='500' height='200' border='0' cellpadding='5' cellspacing='5'>" +
        "<tr><td width='135' style=' font-weight:bold; text-decoration:underline; color:#336699; font-size:20px;'>User Details:-</td>"+
          "<td width='8'>&nbsp;</td>" +
          "<td width='310'>&nbsp;</td>" +
        "</tr>" +
        "<tr>" +
          "<td class='t1'>Name</td>" +
          "<td class='t1'>:</td>" +
          "<td class='t2'>"+un1+ "</td>" +
        "</tr>" +
          "<tr>" +
          "<td class='t1'>Gender</td>" +
          "<td class='t1'>:</td>" +
          "<td class='t2'>"+un7+ "</td>" +
        "</tr>" +
        "<tr>" +
          "<td class='t1'>Contact No</td>" +
          "<td class='t1'>:</td>" +
          "<td class='t2'>"+un8+ "</td>" +
        "</tr></table></div>" +
        
    "<div id='z_phase3'>" +
      "<table width='1111' height='67' border='0' cellpadding='5' cellspacing='5'><tr>" +
          "<td align='right' class='t1'>Pickup Area:</td>" +
          "<td class='t2'>" + un9 + "</td>" +
          "<td align='right' class='t1'>Drop Area:</td>" +
          "<td class='t2'>" + un10 + "</td>" +
           "<td align='right' class='t1'>Pickup Date:</td>" +
          "<td class='t2'>" + un11 + "</td>" +                             
          "<td align='right' class='t1'>Time:</td>" +
          "<td class='t2'>" + un12 + "</td></tr></table></div>" +
    
    "<div id='z_phase4'>" +
      "<table width='1110' height='81' border='0' cellpadding='5' cellspacing='5'>" +
        "<tr>" +
          "<td width='225' class='t1' align='right'>Vehicle Name:</td>" +
          "<td width='162' class='t2'>"+ un2 +"</td>" +
          "<td width='229' class='t1' align='right'>Vehicle Type:</td>" +
          "<td width='429' class='t2'>" + un3 + "</td>" +
        "</tr>" +
        "<tr>" +
          "<td align='right' class='t1'>Vehicle Register No:</td>" +
          "<td class='t2'>" +un4+ "</td>" +
           "<td align='right' class='t1'>Pickup Address:</td>" +
          "<td class='t2'>" +un13+ "</td>" +                             
          "<td align='right' class='t1'>Rate/Km:</td>" +
          "<td class='t2'>"+un5+"</td>" +
        "</tr></table></div>" +
    
    "<div id='z_phase5'>" +
       "<table width='1000' border='0' cellspacing='4' cellpadding='5'>" +
             "<tr><td width='225' align='right' class='t1'>Pickup Address:</td>" +
          "<td width='453' class='t2'>" + un13 + "</td>" +
          "<td width='85' align='right' class='t1'>Track No:</td>" +
          "<td width='172' class='t2'>"+un15+"</td>" +
        "</tr>" +
        "</table>" +
        "<table width='1068' border='0' cellspacing='5' cellpadding='5'>" +
        "<tr>" +
          "<td width='132' align='right' class='t1'>Charges:</td>" +
          "<td width='104' class='t2'>" + un14 + "</td>" +
          "<td width='136' align='right' class='t1'>Extra Km Travelled:</td>" +
          "<td width='277' class='t2'><label for='ekm'></label>" +
          "<input type='text' name='ekm' id='ekm'value='0' ></td>" +
          "<td width='118' align='right' class='t1'>Waiting Charges:</td>" +
          "<td width='245' class='t2'><label for='wcha'></label>" +
          "<input type='text' name='wcha' id='wcha' value='0' ></td></tr><tr>" + 
          "<td align='right' class='t1'></td>" +
          "<td class='t2'></td>" +
          "<td align='right' class='t1'>&nbsp;</td>" +
          "<td class='t2'></td>" +
          "<td align='right' class='t1'>&nbsp;</td>" +
          "<td align='right' class='t2'><input type='submit' name='submit1' id='submit' value='Submit'" +
          "style='color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;'></td>" +
     
          
        "</tr></table></div></div> ");
      
                                 x++;
                            }while(myrs.next());
                            out.println("</ul>");
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
                    
                    
                          
                                
                               %>
   </div>
  </div>
   <%    if(request.getParameter("submit1")!=null)
                            {
                  int fi=0,se=0;              
             fi = Integer.parseInt(un5)* Integer.parseInt(request.getParameter("ekm"));    
            se = Integer.parseInt(request.getParameter("wcha"));
            int th=Integer.parseInt(un14);
            String Total =String.valueOf(fi+se+th);    
           
           
                 String path2= "jdbc:mysql://localhost:3306/ecab";
                Connection mycon2;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    mycon2 = DriverManager.getConnection(path,"root","");
                    String query2 ="update booking set bill=?,cash=?,Status=?  where track_no=?";
                    String query3 ="update cabstatus set Status=?  where date=? and cab_id=?";
                    String query4 ="update driverstatus set Status=?  where driver_id=? and date=?";
                    try{
                        PreparedStatement myst2=mycon2.prepareStatement(query2);
                         PreparedStatement myst3=mycon2.prepareStatement(query3);
                          PreparedStatement myst4=mycon2.prepareStatement(query4);
                          myst2.setString(1,Total);
                        myst2.setString(2,"Paid");
                        myst2.setString(3,"Non-Active");
                        myst2.setString(4,un15);
                         myst3.setString(1,"Non-Active");
                        myst3.setString(2,un11);
                          myst3.setString(3,un20);
                         myst4.setString(1,"Non-Active");
                        myst4.setString(2,un19);
                          myst4.setString(3,un11); 
                        
                        int i= myst2.executeUpdate();
                        int j= myst3.executeUpdate();
                        int k= myst4.executeUpdate();
                        if(i>0&&j>0&&k>0)
                        {
                             Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session2 = Session.getInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ecabservice739@gmail.com","#qwerty@");
				}
			});
		try {
			Message message = new MimeMessage(session2);
        message.addHeader("Content-type", "text/html; charset=UTF-8");
	message.setFrom(new InternetAddress("ecabservice739@gmail.com"));
	message.setRecipients(Message.RecipientType.TO,	InternetAddress.parse(unema));
	message.setSubject("Welcome to eCab");
       message.setText("Booking No :"+un15+" From "+un9+" to "+un10+"  You have Paid :"+Total+"Thank You For using eCab Service.Keep Booking Cabs");
    
        


               
                response.sendRedirect("emp_home.jsp?msg1="+Total+"");
			Transport.send(message);



		}
                catch (MessagingException e)
                {
			throw new RuntimeException(e);
		}
                     
					//out.println("<p style='font-size:18px; color:green;'>Signup Successful</p>" );

                            
                                
                         //   out.println("<td><div style='clear:both; color:Green; font-size:12px;'>Details Updated</td>");
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