<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
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
   if(session.getAttribute("userid")==null)
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

    <%!  String un1="", un2="", un3="" , un4="" , un5="", un6="",un7="", un8="", un9="" , un10="" , un11="", un12="", un13="" , un14="", un15="", un16="",un17=""  ;%>
  <%@include file="header.jsp"%>
  <%@include file="contentusr1.jsp" %>
    <div style="overflow:auto; height:auto; width:auto;">
    <form>
    <div id="tabs">
        <div id="contentmid" style="width:1100px; background-color: #FFFFFF;">
            <ul id="pp">
                <%       
                    String name1=session.getAttribute("userid").toString();  
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking where user_name =? AND Status=?";
                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name1);          
                             myst.setString(2,"Active");
                            ResultSet myrs = myst.executeQuery();
                            
                            if(myrs.next())
                            {
                            int x=1;
                            do{
                            
                                out.println(" <li><a href='#tabs-"+x+"'>"
                                        +"Track No:"+myrs.getString("track_no")
                                                +"</a></li>");
                                
                                 x++;
                            }
                            while(myrs.next());
                            out.println("</ul>");
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
                    
                       
                                
                               %>
   

                               
                               <%        
                        String name2=session.getAttribute("userid").toString();  
                       
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking where user_name =? AND Status=?";
                        try{
                           PreparedStatement myst2=mycon.prepareStatement(query);
                            myst2.setString(1,name2);    
                            myst2.setString(2,"Active");
                            ResultSet myrs = myst2.executeQuery();
                            
                            if(myrs.next())
                            {
                            int x=1;
                            do{
                            un1 = myrs.getString("user_name");
                            un2 = myrs.getString("veh_name");    
                            un3 = myrs.getString("veh_type");
                            un4 = myrs.getString("veh_regno");
                            un5 = myrs.getString("rate/km");
                            un6= myrs.getString("driver_name");
                            un7 = myrs.getString("driver_liceno");
                            un8 = myrs.getString("driver_cont");    
                            un9 = myrs.getString("pick_area");
                            un10 = myrs.getString("drop_area");
                             un11 = myrs.getString("pick_date");;   
                            un12= myrs.getString("pick_time");
                            un13 = myrs.getString("address");
                            un14 = myrs.getString("bill");
                            un15= myrs.getString("track_no");
                            un16= myrs.getString("dri_image");
                            un17=myrs.getString("gender");    
                            
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
          "<td><img src='driverimg/"+un16+"'"+ 
            "width='200' height='200'></td>" +
        "</tr></table></div>" +
     
    "<div id='z_phase2'>"+
      "<table width='500' height='200' border='0' cellpadding='5' cellspacing='5'>" +
        "<tr><td width='135' style=' font-weight:bold; text-decoration:underline; color:#336699; font-size:20px;'>Driver Details</td>"+
          "<td width='8'>&nbsp;</td>" +
          "<td width='310'>&nbsp;</td>" +
        "</tr>" +
        "<tr>" +
          "<td class='t1'>Name</td>" +
          "<td class='t1'>:</td>" +
          "<td class='t2'>"+un6+ "</td>" +
        "</tr>" +
          "<tr>" +
          "<td class='t1'>Gender</td>" +
          "<td class='t1'>:</td>" +
          "<td class='t2'>"+un17+ "</td>" +
        "</tr>" +
        "<tr>" +
          "<td class='t1'>Licence No</td>" +
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
      "<table width='1000' border='0' cellspacing='5' cellpadding='5'><tr>" +
          "<td width='225' align='right' class='t1'>Track No:</td>" +
          "<td width='159' class='t2'>" +un15 + "</td>" +
          "<td width='231' align='right' class='t1'>Charges:</td>" +
          "<td width='320' class='t2'>" + un14 + "</td>" +
        "</tr></table></div></div> ");
      
                                 x++;
                            }while(myrs.next());
                            out.println("</ul>");
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
                    
                    
                               
                                
                               %>

   </div>
  </div>                           
 </form>   
    </div>
   
   
  <%@include file="usr_footer.jsp" %>
 

</body>

</html>