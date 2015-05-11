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
<title>Home</title>
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/fancybox/fancy_script.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/fancy_css.css">
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/jquery.fancybox.css">
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
        $(document).ready(function(){
			 $("#cp2").click(function()
           { 
  $("#cp2").fancybox({
      'autoSize':false,
    'width'  : 650,           // set the width
    'height' : 300,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
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

<body onload=" return sizeshow();" onresize="return sizeshow();">

    <%!  String un1="", un2="", un3="" , un4="" , un5="", un6="",un7="",un8="",un9="" ;%>  
<%@include file="header.jsp"%>
<%@include file="content_emp.jsp" %>

	<div id="contentmid" style="width:1200px;">
            
             <%        
                    if(session.getAttribute("empid")!=null)
                    {
                    String name1=session.getAttribute("empid").toString(); 
                     String mail=session.getAttribute("empemail").toString(); 
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from driver where name =? and email=?";
                         

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name1); 
                             myst.setString(2,mail); 
                            ResultSet myrs = myst.executeQuery();
                            if(myrs.next())
                            {
                             
                            un1 = myrs.getString("name");
                            un2 = myrs.getString("father_name");    
                            un3 = myrs.getString("gender");
                            un4 = myrs.getString("qualification");
                            un5 = myrs.getString("date_of_birth");
                            un6= myrs.getString("contact_no");
                             un7 = myrs.getString("licence_no");
                            un8= myrs.getString("address");
                             un9= myrs.getString("driver_image");
                            
                            }
                            else{
                                response.sendRedirect("emp_home.jsp");
                               out.println("</div>" +
                            "<tr><td><div style='clear:both; margin-left:5px; color:Red;'>Error In Statement</div></td></tr>");
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
		 <table width="792" height="412" border="0" cellpadding="5" cellspacing="5" class="t1">
       <tr>
         <td width="272" height="352" valign="top"><table width="200" height="171" border="0" align="center" cellpadding="5" cellspacing="5">
           <tr>
             <td align="center" width="180px" height="230px"><img src="driverimg/<% out.print(""+un9+"");%>" width="180" height="240"></td>
           </tr>
         </table></td>
         <td width="485" valign="top"><table width="400" height="400" border="0" align="center" cellpadding="5" cellspacing="5">
           <tr>
             <td width="142">Name:</td>
             <td class="t2" width="140"><% out.print(""+un1+"");%></td>
           </tr>
           <tr>
             <td>Father Name:</td>
             <td class="t2"><% out.print(""+un2+"");%></td>
           </tr>
           <tr>
             <td>Gender:</td>
             <td class="t2"><% out.print(""+un3+"");%></td>
           </tr>
           <tr>
             <td>Qualification:</td>
             <td class="t2"><% out.print(""+un4+"");%></td>
           </tr>
           <tr>
             <td>D.O.B</td>
             <td class="t2"><% out.print(""+un5+"");%></td>
           </tr>
           <tr>
             <td>Contact No:</td>
             <td class="t2"><% out.print(""+un6+"");%></td>
           </tr>
           <tr>
             <td>Licence No:</td>
             <td class="t2"><% out.print(""+un7+"");%></td>
           </tr>
           <tr>
             <td>Address:</td>
             <td class="t2"><% out.print(""+un8+"");%></td>
             
           </tr>
           <tr>
             <td>&nbsp;</td>
             <td class="hf"><a class="fancybox fancybox.iframe" id="cp2" href="changepwd4.jsp">Change Password</a></td>
           </tr>
         </table>
        </td>
       </tr>
       <tr>
         <td height="45" valign="top">&nbsp;</td>
         <td align="right" valign="top">&nbsp;</td>
       </tr>
      </table>
	</div>  
 
<%@include file="emp_footer.jsp"%>
   <%
     if(request.getParameter("msg")!=null)
                    {
                      out.println("<script>alert('Password Changed')</script>");
                   //out.println("Password Changed");
                    }
      if(request.getParameter("msg1")!=null)
                    {
                      out.println("<script>alert('Toatl Amount to be Collected :"+request.getParameter("msg1")+"')</script>");
                   //out.println("Password Changed");
                    }
       if(request.getParameter("msg2")!=null)
                    {
                      out.println("<script>alert('Password Not Changed')</script>");
                   //out.println("Password Changed");
                    }
    %>
    
</body>

</html>