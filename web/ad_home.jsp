<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin Home</title>
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
    <div id="contentmid" style="width:1200px;">
      <table width="914" height="220" border="0" cellpadding="5" cellspacing="5">
        <tr>
          <td width="285" height="210" align="center" valign="top"><a href="ad_emp.jsp"><img src="images/addemp.png" width="200" height="200"></a></td>
          <td width="285" align="center" valign="top"><a href="ad_cars.jsp"><img src="images/addcars.png" alt="" width="200" height="200"></a></td>
          <td width="253" align="center" valign="top"><a href="ad_rid.jsp"><img src="images/addrid.png" alt="" width="200" height="200"></a></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table width="1181" height="243" border="0" cellpadding="5" cellspacing="5">
        <tr align="center">
          <td width="208" valign="top"><a href="ad_memp.jsp"><img src="images/memp.jpg" alt="" width="200" height="200"></a></td>
          <td width="211" valign="top"><a href="ad_mcars.jsp"><img src="images/mcar.jpg" alt="" width="200" height="200"></a></td>
          <td width="208" valign="top"><a href="ad_musr.jsp"><img src="images/musr.jpg" alt="" width="200" height="200"></a></td>
          <td width="167" valign="top"><a href="ad_mrid.jsp"><img src="images/mrid.jpg" alt="" width="200" height="200"></a></td>
          <td width="149" valign="top"><a href="ad_mbook.jsp"><img src="images/booking.jpg" alt="" width="200" height="200"></a></td>
        </tr>
      </table>
      <p>&nbsp;</p>
    </div>
    
  <%@include file="ad_footer.jsp" %>

</body>

</html>