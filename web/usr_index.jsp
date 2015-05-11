<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
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
<script language="javascript" type="text/javascript">	
    

function validate()
{
	var parea = document.getElementById('parea').value.trim();
	var darea = document.getElementById('darea1').value.trim();
	var pdate = document.getElementById('pdate').value.trim();
	var ptime = document.getElementById('ptime').value.trim();
	
	if(parea.length <=0)
		{
			alert("Select Pickup Area");
			return false;
		}
		else if(parea == "Select")
		{
			alert("Select Pickup Area");
			return false;
		}
		
		if(darea.length <=0)
		{
			alert("Select Drop Area");
			return false;
		}
		else if(darea == "select")
		{
			alert("Select Drop Area");
			return false;
		}
		
	if (pdate == "" || pdate== null) 
	{
                alert("Enter Date");
				return false;
        }
		
		
	if(ptime.length <=0)
		{
			alert("Select Pickup Time");
			return false;
		}
		else if(ptime == "select")
		{
			alert("Select Pickup Time");
			return false;
		}
	
}

function validate2()
{
	var saddr = document.getElementById('saddr').value.trim();
	var daddr = document.getElementById('daddr1').value.trim();
	
	
	if(saddr.length <=0)
		{
			alert("Select Pickup Area");
			return false;
		}
		else if(saddr == "Select")
		{
			alert("Select Pickup Area");
			return false;
		}
		
		if(daddr.length <=0)
		{
			alert("Select Drop Area");
			return false;
		}
		else if(daddr == "Select")
		{
			alert("Select Drop Area");
			return false;
		}
		
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Manage Cars</title>

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
           
        }
		
		function time()
{
	 sizeshow();
	var d = new Date();
	
	var a = d.getDate();
	var b = d.getMonth()+1;
	var c = d.getFullYear();
	
	if(a>=1 && a<=9)
	{
	a= "0"+ a;
	}
	if(b>=1 && b<=9)
	{
	b= "0"+ b;
	}
	
	var i = c + "-" + b + "-" + a;
	document.getElementById("pdate").min =i;
}
</script>
          <script type="text/javascript">
                    function Check(str)
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
                           
                          document.getElementById("cl").innerHTML="<img src='images/preloader.gif' /> ";  
                        }
                        else if(obj.readyState===4&&obj.status===200)
                        {
                             document.getElementById("main").innerHTML=obj.responseText
                              document.getElementById("answer").innerHTML=" "
                           document.getElementById("darea1").innerHTML=" "
                          
                        }
                    }
                    obj.open("GET","putsec.jsp?parea="+str,true);
                    obj.send();
          }
                    }				
                     
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
                             document.getElementById("main1").innerHTML=obj.responseText
                              document.getElementById("answer1").innerHTML=" "
                           document.getElementById("darea1").innerHTML=" "
                          
                        }
                    }
                    obj.open("GET","putsec.jsp?parea="+str,true);
                    obj.send();
          }
                    }				
                     
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Index</title>


</head>

<body onload="time();" onresize="return sizeshow();">

    <%! ResultSet myrs;%>
  <%@include file="header.jsp"%>
  <%@include file="contentusr1.jsp"%>
    <div id="contentmid">
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
        
     <div id="sub_menu"><u>Location:</u></div>
     <form name="form1" method="post">
       <table width="700" height="274" border="0" cellpadding="5" cellspacing="5" class="t1">
         <tr>
           <td width="242" align="right">Pickup Area:</td>
           <td width="102"><label for="parea"></label>
             <select name="parea" id="parea" onchange="Check(this.value)" style="width:150px" >
               <option>Select</option>
              <%  while(myrs.next()){ %>
            <option><%= myrs.getString(1)%></option>
                        <% } %>
           </select></td>
           <td width="102"></td>
         </tr>
         <tr>
           <td align="right">Drop Area:</td>
           <td colspan="3">
               
                <div id="answer"> 
               <select name="darea1" id="darea1" style="width:150px" >
             <option value="select" selected>Select</option> 
           </select>
            </div>
               <div id="main">  </div>
           </td>
         </tr>
         <tr>
           <td align="right">Pickup Date:</td>
           <td colspan="3"><input type="date" name="pdate" id="pdate"></td>
         </tr>
         <tr>
           <td align="right">Pickup Time:</td>
           <td colspan="3"><label for="ptime"></label>
             <select name="ptime" id="ptime">
               <option value="select" selected="selected">Select</option>
               <option value="12:30 am">12:30 am</option>
               <option value="1:30 am">1:30 am</option>
               <option value="2:30 am">2:30 am</option>
               <option value="3:30 am">3:30 am</option>
               <option value="4:30 am">4:30 am</option>
               <option value="5:30 am">5:30 am</option>
               <option value="6:30 am">6:30 am</option>
               <option value="7:30 am">7:30 am</option>
               <option value="8:30 am">8:30 am</option>
               <option value="9:30 am">9:30 am</option>
               <option value="10:30 am">10:30 am</option>
               <option value="11:30 am">11 :30 am </option>
               <option value="12:30 pm">12:30 pm </option>
               <option value="1:30 pm">1:30 pm</option>
               <option value="2:30 pm ">2:30 pm </option>
               <option value="3:30 pm">3:30 pm</option>
               <option value="4:30 pm">4:30 pm</option>
               <option value="5:30 pm">5:30 pm</option>
               <option value="6:30 pm">6:30 pm</option>
               <option value="7:30 pm">7:30 pm</option>
               <option value="8:30 pm">8:30 pm</option>
               <option value="9:30 pm">9:30 pm</option>
               <option value="10:30 pm">10:30 pm</option>
               <option value="11:30 pm"> 11:30 pm</option>
           </select></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td colspan="3" align="right"><input type="submit" name="submit1" onclick="return validate();" id="submit" value="Find My Taxi"
           style="color:#ffffff; background-color:#336699; width:150px; height:40px; font-size:20px; border-radius:7px;"></td>
         </tr>
       </table>
           
           
          <%
                        
              
                        
                if(request.getParameter("submit1")!=null)
                {               
                    
                  
                            String path2="jdbc:mysql://localhost/ecab";  
                               Class.forName("com.mysql.jdbc.Driver");
                                     Connection mycon1;
                                    try
                                         {
                  
                                       mycon1=DriverManager.getConnection(path2,"root","");
                                              try
                                                    {
                                        String query ="SELECT * from routeid where pickarea=? AND droparea=? ";
                                      
                                     PreparedStatement myst=mycon1.prepareStatement(query);
                                   
     
                                           myst.setString(1,request.getParameter("parea"));
                                            myst.setString(2,request.getParameter("daddr"));
                                           
                                             ResultSet myrs= myst.executeQuery();
                                              
                                                
                                                    if(myrs.next())
                                                    {
                                                         session.setAttribute("parea",request.getParameter("parea"));
                                                    session.setAttribute("darea",request.getParameter("daddr"));
                                                     session.setAttribute("pdate",request.getParameter("pdate"));
                                                      session.setAttribute("ptime",request.getParameter("ptime"));
                                                            session.setAttribute("km",myrs.getString("km"));
                                                        response.sendRedirect("usr_index1.jsp?pdate1="+request.getParameter("pdate"));
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
     
      <%        ResultSet  myrs3 =null;
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon3;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon3 = DriverManager.getConnection(path,"root","");
                         String query ="SELECT DISTINCT pickarea FROM routeid";
                      PreparedStatement myst3=mycon3.prepareStatement(query);
                      myrs3 = myst3.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %> 
<div id="content2" style=" border-left-style: solid; border-width: 1px; border-color: #97B8D2;">
<form name="form2" method="get" action="http://www.google.com/maps?saddr">
  <table width="275" border="0" cellspacing="5" cellpadding="5">
    <tr>
      <td width="232" style=" color:#336699; text-decoration:underline; font-size:20px; padding-top:20px; ">View Route:</td>
    </tr>
    <tr>
      <td class="t1">Pickup Area:</td>
    </tr>
    <tr>
        <td><select name="saddr" id="saddr"  onchange="Check1(this.value)" style="width:150px" >
        <option value="Select" >Select</option>
         <%  while(myrs3.next()){ %>
            <option><%= myrs3.getString(1)%></option>
                        <% } %>
      </select></td>
    </tr>
    <tr>
      <td class="t1">Drop Area:</td>
    </tr>
    <tr>
      <td>
           <div id="answer1"> 
               <select name="daddr1" id="daddr1" style="width:150px" >
             <option >Select</option> 
           </select>
            </div>
               <div id="main1">  </div>
      </td>
    </tr>
      
    <tr>
      <td><input type="submit" name="submit" id="submit2" onclick="return validate2();" value="Submit"
      style="color:#ffffff; background-color:#336699; width:70px; height:25px; font-size:15px; border-radius:7px;"></td>
    </tr>
	 
    </table>
</form>
 </div>
 
<%@include file="usr_footer.jsp"%>
</body>

</html>