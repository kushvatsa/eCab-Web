
<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User Home</title>
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
    </script>
</head>

<body onload=" return sizeshow();" onresize="return sizeshow();">

    <%!  String un1="", un2="", un3="" , un4="" , un5="", un6="" ;%>
  <%@include file="header.jsp"%>
  <%@include file="contentusr1.jsp" %>
    <div id="contentmid">
    <%        
                    if(session.getAttribute("userid")!=null)
                    {
                    String name1=session.getAttribute("userid").toString();  
                    String mai=session.getAttribute("email").toString();  
                       
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    
                    Connection mycon;
                   
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from user where name =? and email=?";
                         

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name1); 
                            myst.setString(2,mai); 
                            ResultSet myrs = myst.executeQuery();
                            
                            if(myrs.next())
                            {
                             
                            un1 = myrs.getString("name");
                            un2 = myrs.getString("email");    
                            un3 = myrs.getString("gender");
                            un4 = myrs.getString("mobile");
                            un5 = myrs.getString("addr");
                            un6= myrs.getString("image");
                            session.setAttribute("usrimg", un6);
                            }
                            else{
                                response.sendRedirect("usr_home.jsp");
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
     <table width="792" height="378" border="0" cellpadding="5" cellspacing="5" class="t1">
       <tr>
         <td width="272" valign="top"><table width="200" height="171" border="0" align="center" cellpadding="5" cellspacing="5">
           <tr>
             <td align="center" width="180px" height="230px"><img src="userimg/<% out.print(""+un6+"");%>" width="180" height="240"></td>
           </tr>
         </table></td>
         <td width="485" valign="top"><table width="359" height="308" border="0" align="center" cellpadding="5" cellspacing="5">
           <tr>
             <td width="142">Name:</td>
             <td class="t2" width="140"><% out.print(""+un1+"");%></td>
           </tr>
           <tr>
             <td>Email:</td>
             <td class="t2"><% out.print(""+un2+"");%></td>
           </tr>
           <tr>
             <td>Gender:</td>
             <td class="t2"><% out.print(""+un3+"");%></td>
           </tr>
           <tr>
             <td>Mobile No:</td>
             <td class="t2"><% out.print(""+un4+"");%></td>
           </tr>
           <tr>
             <td>Address:</td>
             <td class="t2"><% out.print(""+un5+"");%></td>
             
           </tr>
           <tr>
             <td>&nbsp;</td>
             <td>&nbsp;</td>
           </tr>
         </table>
        </td>
       </tr>
       <tr>
         <td height="45" valign="top">&nbsp;</td>
         <td align="right" valign="top">&nbsp;</td>
       </tr>
       <tr>
         <td height="45" valign="top">&nbsp;</td>
         <form name="form2" method="get" action="usr_index.jsp">
         <td align="right" valign="top"><input type="submit" name="booking" id="booking" value="Let's Go For Book A Cab"
         onclick="window.location.href='/usr_index.jsp'"
         style="color:#ffffff; background-color:#336699; width:400px; height:50px; border-radius:10px; font-size:25px"></td>
       	 </form>
       </tr>
     </table>
     
    </div>
    
   
    <div id="content2">
      
    </div>
    
    
  <%@include file="usr_footer.jsp" %>

</body>

</html>