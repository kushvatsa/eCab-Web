<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
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
<meta charset="utf-8">
<title>Manage RouteID</title>
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
		
		 function validatex()
{
	var rid1 = document.getElementById('rid1').value.trim();
	var parea = document.getElementById('parea').value.trim();
	var darea = document.getElementById('darea').value.trim();
	var km = document.getElementById('km').value.trim();
    var letters = /^[A-Za-z]+$/;
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var numbers = /^[0-9]+$/;
	var alpha = /^[0-9a-z]+$/;
	var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
 
	if(rid1 == "select") 
	{
                alert("Select Route Id");
		return false;
        }
	else if(rid1.length <=0) 
	{
            alert("Select Route Id");
            return false;
        }
	
    if (parea == "" || parea == null) 
	{
        alert("Enter Pickup Area");
		return false;
    }

	else if (!parea.match(letters)) 
	{
      alert("Enter characters only");
	  return false;    
    }
	
    if (darea == "" ||darea == null) 
	{
        alert("Enter Pickup Area");
		return false;
    }

	else if (!darea.match(letters)) 
	{
      alert("Enter characters only");
	  return false;    
    }
    
    if (km == "" || km == null) 
	{
        alert("Enter KM");
		return false;
    }

	else if (!km.match(numbers)) 
	{
      alert("Enter in Digit Only");
	  return false;    
    }
}
    </script>
</head>

<body onload=" return sizeshow();" onresize="return sizeshow();">
<%@include file="header.jsp"%>
<%@include file="content1.jsp" %>
<%!  String un1="", un2="", un3="" , un4=""; %>
 <%! ResultSet myrs11;%>
<div id="contentmid">
<%        
            if(request.getParameter("show")!=null)
            {
                    String name = request.getParameter("rid1");    
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from routeid where route_id=?";
                         

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name);          
                      ResultSet myrs = myst.executeQuery();
                            
                            if(myrs.next())
                            {
                             un1 = myrs.getString("route_id");    
                            un2 = myrs.getString("pickarea");
                            un3 = myrs.getString("droparea");
                            un4 = myrs.getString("km");
                           
                            }
                            else{
                                response.sendRedirect("ad_mrid.jsp");
                               out.println("</div>" +
                            "<tr><td><div style='clear:both; margin-left:5px; color:Red;'>Data Not Present</div></td></tr>");
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
                    
            } else  if(request.getParameter("reset")!=null)
                        {
                un1=""; un2=""; un3="";un4="";
            }
                                
                               %> 
                               
    
                                <%    if(request.getParameter("Update")!=null)
                            {
                            String route_id = request.getParameter("rid1");    
                            String pickarea = request.getParameter("parea");
                            String droparea = request.getParameter("darea");    
                            String km = request.getParameter("km");
                 String path= "jdbc:mysql://localhost:3306/ecab";
                Connection mycon;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    mycon = DriverManager.getConnection(path,"root","");
                    String query ="update routeid set route_id=?,pickarea=?,droparea=?,km=? where route_id=?";


                    try{
                        PreparedStatement myst=mycon.prepareStatement(query);
                        myst.setString(1,route_id);
                        myst.setString(2,pickarea);
                        myst.setString(3,droparea);
                        myst.setString(4,km);
                         myst.setString(5,route_id);
                        int i= myst.executeUpdate();

                        if(i>0)
                      {
                         out.println("<div style='text-align:center; color:green;'>Details Updated</div>");
                      }
                      else{
                      out.println("<div style='text-align:center; color:red;'>Details Not Updated</div>");
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
                un1=""; un2=""; un3="";un4="";
            }
                 
              
              if(request.getParameter("Delete")!=null)
                            {
            String route_id = request.getParameter("rid1");    
                 String path= "jdbc:mysql://localhost:3306/ecab";
                Connection mycon;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    mycon = DriverManager.getConnection(path,"root","");
                    String query ="Delete from routeid where route_id=?";


                    try{
                        PreparedStatement myst=mycon.prepareStatement(query);
                        myst.setString(1,route_id);
                        int i= myst.executeUpdate();

                        if(i>0)
                        {
                            
                            out.println("<td><div style='clear:both; color:Green; font-size:12px;'>Record Deleted</td>");
                        }
                        else{
                           out.println("</div>" +
                        "<td><div style='clear:both; margin-left:5px; color:Red;'>Record Not Deleted</div></td>");
                            
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
                un1=""; un2=""; un3="";un4="";
            }
%>

 <%        
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from routeid ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                         myrs11 = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %> 
       <div id="sub_menu"><u>Manage Route Id:</u>
 
     </div>
                               <form method="post" >
  <table width="500" border="0" align="center" cellpadding="5" cellspacing="5" class="t1">
       <tr>
          
         <td> Route id:</td>
         <td>
               <select name="rid1" id="rid1">
             <option value="select" selected>Select</option>
                 <% if(myrs11.next())
             { 
                 do
                 {
                     if(un1.equals(myrs11.getString("route_id")))
                     {
                         out.println("<option Selected>"+myrs11.getString("route_id")+"</option>");
                     }
                     else
                     {
                         out.println("<option>"+myrs11.getString("route_id")+"</option>");
                     }
                 }while(myrs11.next());
                 
             }   
                 %>
                 
                 </select>
         <input type="submit" name="show" id="show" value="Show"></td>
       </tr>
       <tr>
         <td>Pickup Area:</td>
         <td><label for="parea"></label>
         <input type="text" name="parea" id="parea" value="<% out.print(""+un2+""); %>"></td>
       </tr>
       <tr>
         <td>Drop Area:</td>
         <td><label for="darea"></label>
         <input type="text" name="darea" id="darea" value="<% out.print(""+un3+""); %>"></td>
       </tr>
       <tr>
         <td>Km:</td>
         <td><label for="km"></label>
         <input type="text" name="km" id="km" value="<% out.print(""+un4+""); %>"></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td><input type="submit" name="Update" id="Update" value="Update" onClick="return validatex();"
         style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
         <input type="submit" name="reset" id="reset"  value="Reset"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
             <input type="submit" name="Delete" id="Delete" value="Delete" onClick="javascript: return confirm('Please confirm deletion');"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px; "></td>
       </tr>
       <tr>
         
       </tr>
  </table>
                 </form>
</div>
 <%@include file="ad_footer.jsp" %>
</body>
</html>