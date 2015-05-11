<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/jquery-ui.css">
<script type="text/javascript" src="js/fancybox/fancy_script.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/fancy_css.css">
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/jquery.fancybox.css">
<script type="text/javascript">
$(document).ready(function(){
			 $("#am1").click(function()
           { 
  $("#am1").fancybox({
      'autoSize':false,
    'width'  : 800,           // set the width
    'height' : 400,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
}); 
$(document).ready(function(){
			 $("#am2").click(function()
           { 
  $("#am2").fancybox({
      'autoSize':false,
    'width'  : 800,           // set the width
    'height' : 400,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
}); 
        </script>
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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Accounts</title>

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
    <div id="contentmid" style="width:1100px;">
     <div id="sub_menu"><u>Accounts:</u></div>
     <form  method="post">
       <table width="530" border="0" align="center" cellpadding="5" cellspacing="5">
         <tr>
           <td width="230" align="center">
           <a class="fancybox fancybox.iframe" id="am1" href="ad_accounts_car.jsp"><img src="images/car_accnt.png" alt="Cars Account" width="200" height="200"></a></td>
           <td width="265" align="center">
           <a class="fancybox fancybox.iframe" id="am2" href="ad_accounts_emp.jsp"><img src="images/emp_accnt.jpg" alt="Employees Account" width="200" height="200"></a></td>
         </tr>
       </table>
       
     </form>
</div>
     
   
  <%@include file="ad_footer.jsp" %>

</body>
 <%
     if(request.getParameter("msg0")!=null)
                    {
                      out.println("<script>alert('Details Updated')</script>");
                   //out.println("Password Changed");
                    }   
    
     if(request.getParameter("msg01")!=null)
                    {
                      out.println("<script>alert('Details Not Updated')</script>");
                   //out.println("Password Changed");
                    }   
     %>
</html>