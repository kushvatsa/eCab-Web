<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Map</title>
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
	<script type="text/javascript">
		
		function validate2()
		{
		var saddr = document.getElementById('parea').value.trim();
		var daddr = document.getElementById('darea').value.trim();
		
		
		if(saddr.length <=0)
			{
				alert("Select Pickup Area");
				return false;
			}
			else if(saddr == "select")
			{
				alert("Select Pickup Area");
				return false;
			}
			
			if(daddr.length <=0)
			{
				alert("Select Drop Area");
				return false;
			}
			else if(daddr == "select")
			{
				alert("Select Drop Area");
				return false;
			}
			
	}
    </script>
   <script type="text/javascript">
                         function Check1(str)
                    {
                        if(str!="Select")
                        {
                    if(window.ActiveXObject)
                    {
                        obj=new ActiveXObject("Microsoft.ActiveXObject");
                    }
                    else if(window.XMLHttpRequest)
                    {
                        obj=new XMLHttpRequest();
                    }
                    obj.onreadystatechange=function()
                    {
                        if(obj.readyState<4)
                        {
                           
                         // document.getElementById("cl").innerHTML="<img src='images/preloader.gif' /> ";  
                        }
                        else if(obj.readyState===4&&obj.status===200)
                        {
                             document.getElementById("main1").innerHTML=obj.responseText;
                              document.getElementById("answer1").innerHTML=" ";
                           document.getElementById("darea1").innerHTML=" ";
                          
                        }
                    }
                    obj.open("GET","putsec.jsp?parea="+str,true);
                    obj.send();
          }
                    }				
                     
    </script>
</head>

<body onload=" return sizeshow();" onresize="return sizeshow();">

   
  <%@include file="header.jsp"%>
  <%@include file="contentusr1.jsp" %>
  <%! ResultSet myrs;%>
    <div id="contentmid" style="width:1200px;">
         <%        
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="SELECT DISTINCT pickarea FROM routeid";
                      PreparedStatement myst=mycon.prepareStatement(query);
                         myrs = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %> 
        
    <div style="float:left; width:560px;">
    <div id="sub_menu"><u>View Route:</u></div>
      <form name="form1" method="get" action="http://www.google.com/maps?saddr" >
        <table width="479" height="125" border="0" cellpadding="5" cellspacing="5" class="t1">
          <tr>
            <td width="214" align="right">Pickup Area:</td>
            <td width="230"><label for="saddr"></label>
              <select name="saddr" id="parea" onchange="Check1(this.value)" style="width:150px" >
                <option>Select</option>
                <%  while(myrs.next()){ %>
            <option><%= myrs.getString(1)%></option>
                        <% } %>
            </select></td>
          </tr>
          <tr>
           <td align="right">Drop Area:</td>
           <td colspan="3">
               
                <div id="answer1"> 
               <select name="darea1" id="darea1" style="width:150px;" >
             <option value="select" selected>Select</option> 
           </select>
            </div>
               <div id="main1">  </div>
           </td>
         </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td align="right"><input type="submit" name="submit" onclick="return validate2();" id="submit" value="Submit"
            style="color:#ffffff; background-color:#336699; width:80px; height:27px; font-size:15px; border-radius:5px;"></td>
          </tr>
        </table>
      </form>
      </div>
      <div style="float:left; width:630px; height:350px; margin-top:100px;">
      <img src="images/map.jpg" width="630" height="315" alt="Google Map"> </div>
    </div>
   
   
    
  <%@include file="usr_footer.jsp" %>

</body>

</html>