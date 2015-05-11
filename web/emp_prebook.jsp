<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<link href="style_ecab/StyleSheet2.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pre- Booking</title>
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
    <div id="contentmid">
    <div style="float:left;" id="sub_menu"><u>Previous Bookings:</u></div>
      <%
    String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                             String query ="select * from booking where driver_name=? ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                        myst.setString(1,session.getAttribute("empid").toString());
                     ResultSet myrs = myst.executeQuery();
           
        
        out.print("<TABLE BORDER='1px' width='1200' height='30' cellspacing='2' cellpadding='3'>" +
            
               "<TR bgcolor='#336699' style='color:#ffffff;'> <TH>Track No</TH>" +
                 " <TH>User Name</TH>" +
                "<TH>Driver Name</TH>" +
                 "<TH>Driver Mobile</TH>" +
                "<TH>Vehicle Name</TH>" +
                "<TH>Vehicle Type</TH>" +
                "<TH>Vehicle No</TH>" +
                "<TH>Rate/km</TH>" +
                "<TH>Pick Area</TH>" +
                 "<TH>Drop Area</TH>" +
                 "<TH>Pick Date</TH>" +
                 "<TH>Pick Time</TH>" +
                 "<TH>Bill</TH>" +
                 "<TH>Status</TH>" +
              "<TH>Payment</TH>" +
                "</TR>" );
            
                    int x=2;
                   
            while(myrs.next()){
 			
                            if(x%2==0)
                            {
                              out.print("<TR bgcolor='#97B8D2'>");   
                            }else{
                                out.print("<TR>");
                            }x++;
            
              out.print("<TD>" + myrs.getString(17) + "</TD>" +
                "<TD>" + myrs.getString(1) + "</TD>" +
                "<TD>" + myrs.getString(6) + "</TD>" +
                      "<TD>" + myrs.getString(10) + "</TD>" +
                       "<TD>" + myrs.getString(2) + "</TD>" +
                      "<TD>" + myrs.getString(3) + "</TD>" +
                      "<TD>" + myrs.getString(4) + "</TD>" +
                      "<TD>" + myrs.getString(5) + "</TD>" +
                      "<TD>" + myrs.getString(11) + "</TD>" +
                      "<TD>" + myrs.getString(12) + "</TD>" +
                      "<TD>" + myrs.getString(13) + "</TD>" +
                      "<TD>" + myrs.getString(14) + "</TD>" +
                       "<TD>" + myrs.getString(16) + "</TD>" +
                        "<TD>" + myrs.getString(19) + "</TD>" +
            "<TD>" + myrs.getString(20) +"</TD></TR>" );
             
            
            }
            out.print("</TABLE>");
         
    %>
    
  	</div>
   </div>
   
  <%@include file="emp_footer.jsp" %>

</body>

</html>