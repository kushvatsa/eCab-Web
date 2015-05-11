<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<link href="style_ecab/StyleSheet2.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reports</title>
<%
    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
    %>


  <%
   if(session.getAttribute("adminid")==null)
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
  <%@include file="content1.jsp" %>
    <div id="contentmid">
    <div style="float:left;" id="sub_menu" ><u>Reports:</u></div>
    <div style=" clear:both; float:left; width:150px; height:450px;">
     <form name="form1" method="post" action="">
       <table width="142" height="189" border="0" cellpadding="5" cellspacing="5" style="padding-left:50px" class="t1">
         <tr >
        
           <td width="436"><input name="Submit1" type="Submit" value="User Data"
           style=" background-color:#336699; color:#ffffff; border-radius:7px; width:150px; height:30px;"></td>
         </tr>
         <tr>
           <td><input name="Submit2" type="Submit" value="Cab Data"
           style=" background-color:#336699; color:#ffffff; border-radius:7px; width:150px; height:30px;"></td>
         </tr>
         <tr>
           <td><input name="Submit3" type="Submit" value="Employee Data"
           style=" background-color:#336699; color:#ffffff; border-radius:7px; width:150px; height:30px;"></td>
         </tr>
            <tr>
           <td><input name="Submit5" type="Submit" value="Bookings Data"
           style=" background-color:#336699; color:#ffffff; border-radius:7px; width:150px; height:30px;"></td>
         </tr>
         <tr>
           <td><input name="Submit4" type="Submit" value="Feedback Data"
           style=" background-color:#336699; color:#ffffff; border-radius:7px; width:150px; height:30px;"></td>
         </tr>
            <tr>
           <td><input name="Submit6" type="Submit" value="Driver Query"
           style=" background-color:#336699; color:#ffffff; border-radius:7px; width:150px; height:30px;"></td>
         </tr>
            <tr>
           <td><input name="Submit7" type="Submit" value="Lost & Found"
           style=" background-color:#336699; color:#ffffff; border-radius:7px; width:150px; height:30px;"></td>
         </tr>
       </table>
     </form>
     </div>
     <div style="float:left; margin-left:100px; width:550px; height:450px; font-size: 15px; ">
     <div style=" overflow:auto; width:950px; height:450px;">
     <% 
         if(request.getParameter("Submit2")!=null)
         {
            String path= "jdbc:mysql://localhost:3306/ecab";
                    //  String place="courierdb";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");

            Statement statement = mycon.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from cabs") ; 
        
        out.print("<TABLE BORDER='1' width='830' height='30' cellspacing='2' cellpadding='5'>" +
            
               "<TR bgcolor='#336699' style='color:#ffffff;'> <TH>Vehicle Name</TH>" +
                "<TH>Type</TH>" +
                "<TH>Register No</TH>" +
                "<TH>Rate/Km</TH>" +
                "<TH>Capacity</TH>" +
                    "<TH>Car Cost</TH>" +
                 "<TH>Other Charges</TH>" +
                 "<TH>Total Cost</TH>" +
                 "<TH>Update</TH></TR>" );
            
                    int x=2;
                   
            while(resultset.next()){
 			 int to=Integer.parseInt(resultset.getString(8))+Integer.parseInt(resultset.getString(9));
                            if(x%2==0)
                            {
                              out.print("<TR bgcolor='#97B8D2'>");   
                            }else{
                                out.print("<TR>");
                            }x++;
           
              out.print("<TD>" + resultset.getString(1) + "</TD>" +
                "<TD>" + resultset.getString(2) + "</TD>" +
                "<TD>" + resultset.getString(3) + "</TD>" +
                      "<TD>" + resultset.getString(4) + "</TD>" +
                       "<TD>" + resultset.getString(5) + "</TD>" +
                      "<TD>" + resultset.getString(8) + "</TD>" +
                       "<TD>" + resultset.getString(9) + "</TD>" +
                       "<TD>" + String.valueOf(to)  + "</TD>" +
                       "<TD><a href='ad_mcars.jsp?id1=" + resultset.getString(1) + "'>Update</a></TD></TR>" );
             
            
            }
            out.print("</TABLE>");
         }
            %>
            
            <% 
         if(request.getParameter("Submit1")!=null)
         {
            String path= "jdbc:mysql://localhost:3306/ecab";
                    //  String place="courierdb";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");

            Statement statement = mycon.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from user") ; 
        
        out.print("<TABLE BORDER='1' width='800' height='10'>" +
            
               "<TR  bgcolor='#336699' style='color:#ffffff;'> <TH>Name</TH>" +
                "<TH>Email</TH>" +
                "<TH>Gender</TH>" +
                "<TH>Mobile</TH>" +
                 "<TH>Address</TH>" +
                " <TH>Update</TH></TR>" );
            
                    int x=2;
            while(resultset.next()){
                         if(x%2==0)
                            {
                              out.print("<TR bgcolor='#97B8D2'>");   
                            }else{
                                out.print("<TR>");
                            }x++;
                
              out.print("<TD>" + resultset.getString(2) + "</TD>" +
                       "<TD>" + resultset.getString(1) + "</TD>" +
                "<TD>" + resultset.getString(3) + "</TD>" +
                "<TD>" + resultset.getString(4) + "</TD>" +
                      "<TD>" + resultset.getString(5) + "</TD>" +
                       
                       "<TD><a href='ad_musr.jsp?id1=" + resultset.getString(1) + "'>Update</a></TD></TR>" );
            
            
            }
            out.print("</TABLE>");
         }
            %>
            
            <% 
         if(request.getParameter("Submit3")!=null)
         {
            String path= "jdbc:mysql://localhost:3306/ecab";
                    //  String place="courierdb";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");

            Statement statement = mycon.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from driver") ; 
        
        out.print("<TABLE BORDER='1' width='850' height='10'>" +
            
               "<TR  bgcolor='#336699' style='color:#ffffff;'> " +
                "<TH>Name</TH>" +
                "<TH>Father Name</TH>" +
                "<TH>Qualification</TH>" +
                "<TH>Gender</TH>" +
                 "<TH>D.O.B</TH>" +
                 "<TH>Vehicle Required</TH>" +
                 "<TH>Licence No</TH>" +
                 "<TH>Address</TH>" +
                 "<TH>Contact</TH>"+
                "<TH>Salary</TH>"+
                 "<TH>Allowances</TH>"+
                 "<TH>Total</TH>"+
                 "<TH>Update</TH>"+"</TR>" );
            
                    int y=2;
            while(resultset.next()){
                 int tot=Integer.parseInt(resultset.getString(13))+Integer.parseInt(resultset.getString(14));
                      if(y%2==0)
                            {
                              out.print("<TR bgcolor='#97B8D2'>");   
                            }else{
                                out.print("<TR>");
                            }y++;
            
              
              out.print(  "<TD>" + resultset.getString(2) + "</TD>" +
                "<TD>" + resultset.getString(4) + "</TD>" +
                      "<TD>" + resultset.getString(5) + "</TD>" +
                       "<TD>" + resultset.getString(6) + "</TD>" +
                       "<TD>" + resultset.getString(7) + "</TD>" +
                       "<TD>" + resultset.getString(8) + "</TD>" +
                       "<TD>" + resultset.getString(9) + "</TD>" +
                       "<TD>" + resultset.getString(10) + "</TD>" +
                         "<TD>" + resultset.getString(11) +"</TD>"+
                        "<TD>" + resultset.getString(13) +"</TD>"+
                       "<TD>" + resultset.getString(14) +"</TD>"+
                      "<TD>" + String.valueOf(tot) +"</TD>"+
                      "<TD><a href='ad_memp.jsp?id1=" + resultset.getString(1) + "'>Update</a></TD></TR>" );
            
            
            }
            out.print("</TABLE>");
         }
            %>
            
               <% 
         if(request.getParameter("Submit4")!=null)
         {
            String path= "jdbc:mysql://localhost:3306/ecab";
                    //  String place="courierdb";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");

            Statement statement = mycon.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from feedback") ; 
        
        out.print("<TABLE BORDER='1' width='550' height='10'>" +
            
               "<TR  bgcolor='#336699' style='color:#ffffff;'> <TH>Rating</TH>" +
                "<TH>Name</TH>" +
                 "<TH>Feedback</TH>" +"</TR>" );
            
             int x1=0;       
            while(resultset.next())
            {
             if(x1%2==0)
                            {
                              out.print("<TR bgcolor='#97B8D2'>");   
                            }else{
                                out.print("<TR>");
                            }x1++;
              out.print("<TR><TD>" + resultset.getString(1) + "</TD>" +
                       "<TD>" + resultset.getString(2) + "</TD>" +
            "<TD>" + resultset.getString(3) +"</TD></TR>" );
            
            
            }
            out.print("</TABLE>");
         }
           if(request.getParameter("Submit5")!=null)
         {
                   String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                             String query ="select * from booking ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                     ResultSet myrs = myst.executeQuery();
           
        
        out.print("<TABLE BORDER='1px' width='1200' height='30' cellspacing='2' cellpadding='3'>" +
            
               "<TR bgcolor='#336699' style='color:#ffffff;'> <TH>Track No</TH>" +
                 " <TH>User Name</TH>" +
                "<TH>Driver Name</TH>" +
                "<TH>Driver Licence</TH>" +
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
                " <TH>Update</TH></TR>" );
            
                    int x=2;
                   
            while(myrs.next()){
 			
                            if(x%2==0)
                            {
                              out.print("<TR bgcolor='#97B8D2'>");   
                            }else{
                                out.print("<TR>");
                            }x++;
            
              out.print("<TD>" + myrs.getString(16) + "</TD>" +
                "<TD>" + myrs.getString(1) + "</TD>" +
                "<TD>" + myrs.getString(6) + "</TD>" +
                       "<TD>" + myrs.getString(8) + "</TD>" +
                      "<TD>" + myrs.getString(9) + "</TD>" +
                       "<TD>" + myrs.getString(2) + "</TD>" +
                      "<TD>" + myrs.getString(3) + "</TD>" +
                      "<TD>" + myrs.getString(4) + "</TD>" +
                      "<TD>" + myrs.getString(5) + "</TD>" +
                      "<TD>" + myrs.getString(10) + "</TD>" +
                      "<TD>" + myrs.getString(11) + "</TD>" +
                      "<TD>" + myrs.getString(12) + "</TD>" +
                      "<TD>" + myrs.getString(13) + "</TD>" +
                       "<TD>" + myrs.getString(15) + "</TD>" +
                        "<TD>" + myrs.getString(18) + "</TD>" +
            "<TD>" + myrs.getString(19) +"</TD>"
                      + " <TD><a href='ad_mbook.jsp?id1=" + myrs.getString(17) + "'>Update</a></TD></TR>" );
            }
            out.print("</TABLE>");    
         }
           
            if(request.getParameter("Submit6")!=null)
         {
            String path= "jdbc:mysql://localhost:3306/ecab";
                    //  String place="courierdb";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");

            Statement statement = mycon.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from driver_query") ; 
        
        out.print("<TABLE BORDER='1' width='550' height='10'>" +
            
               "<TR  bgcolor='#336699' style='color:#ffffff;'> <TH>Driver ID</TH>" +
                "<TH>Driver Name</TH>" +
                 "<TH>Query</TH>" +"</TR>" );
            
                    int x=0;
            while(resultset.next())
            {
                 if(x%2==0)
                            {
                              out.print("<TR bgcolor='#97B8D2'>");   
                            }else{
                                out.print("<TR>");
                            }x++;
              out.print("<TR><TD>" + resultset.getString(1) + "</TD>" +
                       "<TD>" + resultset.getString(2) + "</TD>" +
            "<TD>" + resultset.getString(3) +"</TD></TR>" );
            }
            out.print("</TABLE>");
         }
             if(request.getParameter("Submit7")!=null)
         {
            String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");

            Statement statement = mycon.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from lostfound") ; 
        
        out.print("<TABLE BORDER='1' width='800' height='10'>" +
            
               "<TR  bgcolor='#336699' style='color:#ffffff;'> <TH>Name</TH>" +
                "<TH>Mobile</TH>" +
                    "<TH>Email</TH>" +
                 "<TH>Date</TH>" +
                  "<TH>Time</TH>" +
                  "<TH>City</TH>" +
                  "<TH>Pick Area</TH>" +
                " <TH>Item Description</TH></TR>" );
            
                    int x=2;
            while(resultset.next()){
                         if(x%2==0)
                            {
                              out.print("<TR bgcolor='#97B8D2'>");   
                            }else{
                                out.print("<TR>");
                            }x++;
                
              out.print("<TD>" + resultset.getString(1) + "</TD>" +
                       "<TD>" + resultset.getString(2) + "</TD>" +
                "<TD>" + resultset.getString(3) + "</TD>" +
                "<TD>" + resultset.getString(4) + "</TD>" +
                      "<TD>" + resultset.getString(5) + "</TD>" +
                       "<TD>" + resultset.getString(6) + "</TD>" +
                       "<TD>" + resultset.getString(7) + "</TD>" +
               "<TD>" + resultset.getString(8) + "</TD>");
            
            
            }
            out.print("</TABLE>");
         }
            %>
     </div>
    </div>
   </div>
   
  <%@include file="ad_footer.jsp" %>

</body>

</html>