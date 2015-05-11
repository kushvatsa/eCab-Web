<%@page import="java.util.Random"%>
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
<title>Add RouteID</title>
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
	
	var parea = document.getElementById('parea').value.trim();
	var darea = document.getElementById('darea').value.trim();
	var km = document.getElementById('km').value.trim();
    var letters = /^[A-Za-z]+$/;
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var numbers = /^[0-9]+$/;
	var alpha = /^[0-9a-z]+$/;
	var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
 
	
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

<div id="contentmid">

     <div id="sub_menu"><u>Add Route Id:</u>

     </div>
    <form method="post">
  <table width="500" border="0" align="center" cellpadding="5" cellspacing="5" class="t1">
  
      
       <tr>
         <td>Pickup Area:</td>
         <td><label for="parea"></label>
         <input type="text" name="parea" id="parea"></td>
       </tr>
       <tr>
         <td>Drop Area:</td>
         <td><label for="darea"></label>
         <input type="text" name="darea" id="darea"></td>
       </tr>
        <tr>
         <td>Km:</td>
         <td><label for="km"></label>
         <input type="text" name="km" id="km"></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td><input type="submit" name="Add" id="Add" value="Submit" onClick="return validatex();"
         style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
         <input type="submit" name="reset" id="reset"  value="Reset"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
       </tr>
  </table>
  <%
                 if(request.getParameter("Add")!=null)
                           {
              
              String path2="jdbc:mysql://localhost/ecab";
              Class.forName("com.mysql.jdbc.Driver");
              Connection mycon1;
                Random rand = new Random();
              int n = (rand.nextInt(900) + 100);
              String track=String.valueOf(n);
              try
              {
                  
                  mycon1=DriverManager.getConnection(path2,"root","");
                  
                  try
                  {
                      String query ="insert into routeid values(?,?,?,?)";
                    PreparedStatement myst=mycon1.prepareStatement(query);
                            myst.setString(1,track);
                            myst.setString(2,request.getParameter("parea"));
                            myst.setString(3,request.getParameter("darea"));
                            myst.setString(4,request.getParameter("km"));
                            int i= myst.executeUpdate();

                            if(i>0)
                            {
                                out.println("<td>Details Saved</td>");
                            }
                            else{
                               out.println("<td>Details Not Saved<</td>");
                            }
                   
                  }
                  catch(Exception e)
                    {
                        out.println("Error in Query " + e.getMessage());
                    }
                  finally
                  {
                      mycon1.close();
                  }
              }
              catch(Exception e)
              {
                  out.println("Error in Connection " + e.getMessage());
              }
              }
             
   
%>    
        
               </form>

</div>
 <%@include file="ad_footer.jsp" %>
</body>
</html>