<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<html>
<head>
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Index</title>
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
function validate1()
{
	
	var scars = document.getElementById('scars').value.trim();

	if(scars.length <=0)
		{
			alert("Select Car");
			return false;
		}
		else if(scars == "select")
		{
			alert("Select Car");
			return false;
		}
		

}

</script>
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
                        if(obj.readyState===4&&obj.status===200)
                        {
                             document.getElementById("show").innerHTML=obj.responseText
                         
                        }
                    }
                    obj.open("GET","putsec.jsp?show="+str,true);
                    obj.send();
          }
                    }
    </script>
</head>

<body onload=" return sizeshow();" onresize="return sizeshow();">

    <%! ResultSet myrs;%>
  <%@include file="header.jsp"%>
  <%@include file="contentusr1.jsp"%>
    <div id="contentmid" style="width:1200px;">
      <div id="index1_left">
       
     <div id="sub_menu"><u>Select Cars:</u></div>
      
     <form name="form1" method="post" action="">
       <table width="462" height="172" border="0" cellpadding="5" cellspacing="5" class="t1">
         <tr>
           <td width="158" align="right">Select Car:</td>
           <td width="288"><label for="parea"></label>
           <label for="scars"></label>
           <select name="scars" id="scars" onchange="Check(this.value)" >
             <option value="select" selected>Select</option>
            
             <option value="Hatchback">Hatchback</option>
             <option value="Sedan">Sedan</option>
             <option value="SUV">SUV</option>
        
           </select></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td align="right">
           <input type="submit" name="submit" id="submit" value="Select My Taxi" onclick="return validate1()"
           style="color:#ffffff; background-color:#336699; width:150px; height:35px; font-size:20px; border-radius:7px;"></td>
         </tr>
           <%! String unid= null;%>
            <%
 //  out.println(session.getAttribute("pdate"));
   
   
                if(request.getParameter("submit")!=null)
                         {                                 
                                   
                           unid=null;
                             session.setAttribute("rid",unid);
                            String dateReceived =request.getParameter("pdate1");
                        DateFormat userDateFormat = new SimpleDateFormat("yyyy-mm-dd");
                        DateFormat dateFormatNeeded = new SimpleDateFormat("dd-mm-yyyy");
                        java.util.Date date = userDateFormat.parse(dateReceived);
                        String cd = dateFormatNeeded.format(date);
                        session.setAttribute("ac",cd);
                             
            try
                  {  
                      Class.forName("com.mysql.jdbc.Driver");
                  
                      Connection mc=DriverManager.getConnection("jdbc:mysql://localhost/ecab","root","");
                  
                     try
                       {
                         
                           PreparedStatement ps4=mc.prepareStatement("select * from driverstatus where date=? and Status=?");
                                ps4.setString(1,cd);
                                 ps4.setString(2,"Active");
                            ResultSet rs4=ps4.executeQuery();
                            if(rs4.next()&&rs4.getString("date").equals(cd))
                            { 
                               String s=null ;
                                do
                                {  
                                 s = s +","+rs4.getString("driver_id") ;       
                                   }while(rs4.next());
                                unid=s.substring(5);
                             session.setAttribute("rid",unid);
                             }
                                   
                                   else
                                   {
                                       
                             PreparedStatement ps5=mc.prepareStatement("select * from driver ");
                            ResultSet rs5=ps5.executeQuery();
                          
                              if(rs5.next())
                                                    {
                                                        
                                                      session.setAttribute("drouteid",rs5.getString("driver_id"));
                                                         session.setAttribute("d_name",rs5.getString("name"));
                                                           session.setAttribute("d_lice",rs5.getString("licence_no"));
                                                           session.setAttribute("d_conta",rs5.getString("contact_no"));
                                                             session.setAttribute("d_image",rs5.getString("driver_image"));
                                                             session.setAttribute("d_gender",rs5.getString("gender"));
                                                            response.sendRedirect("usr_index2.jsp");       
                                                    }
                            
                            
                            
                                   }
                                
                            
                         
                         
                         }
                     catch(Exception e)
                     {
                         out.println("Error in Query: "+e.getMessage());
                     }
                     finally
                     {
                         mc.close();
                     }
                  }
                  catch(Exception e)
                  {
                      out.println("Error in Connection: "+e.getMessage());
                  }
         
                       
          
           if(unid!=null)
           {
               
               String path2="jdbc:mysql://localhost/ecab";
                               Class.forName("com.mysql.jdbc.Driver");
                                     Connection mycon4;
                                    try
                                         {
                  
                                       mycon4=DriverManager.getConnection(path2,"root","");
                                              try
                                                    {
                                        String query ="select * from driver where driver_id NOT IN ("+unid+")";
                                     PreparedStatement myst4=mycon4.prepareStatement(query);
        
                                      //  myst4.setString(1,unid);
                                           
                                             ResultSet myrs4= myst4.executeQuery();
                                                        
                                                    if(myrs4.next())
                                                    {
                                                        
                                                      session.setAttribute("drouteid",myrs4.getString("driver_id"));
                                                         session.setAttribute("d_name",myrs4.getString("name"));
                                                           session.setAttribute("d_lice",myrs4.getString("licence_no"));
                                                           session.setAttribute("d_conta",myrs4.getString("contact_no"));
                                                             session.setAttribute("d_image",myrs4.getString("driver_image"));
                                                             session.setAttribute("d_gender",myrs4.getString("gender"));
                                                            response.sendRedirect("usr_index2.jsp");       
                                                    }
                           
                                            }
                                            catch(Exception e)
                                              {
                                                  out.println("Error in Query " + e.getMessage());
                                              }
                                            finally
                                            {
                                                mycon4.close();
                                            }
                                        }
                                        catch(Exception e)
                                         {
                                            out.println("Error in Connection " + e.getMessage());
                                                 } 
               
               
               }
               
           }
           %>
           
           
                    
       </table>
     </form>
       <div style="clear:both; height:150px; width:550px;">
     <div style=" clear:both; margin-left:50px; background-color:#E4E8EB; height:260px; width:450px; border-radius:5px;">
         <p> 
          <strong>PLEASE READ THESE TERMS CAREFULLY BEFORE USING OUR SERVICE.</strong>
         </p>
         <ul>
             <li>Cabs will get allocated purely based on availability. Priority will be given to the eCabs under Radio Taxi License.</li></br>
         <li>Choose Car Type from above Box on basis of Rate/Km.</li></br>
             <li>Actual fare will be based on actual distance travelled.</li></br>
             <li>Toll & parking charges and any taxes extra as applicable.</li></br>
             <li>Final fare payable will include Service Tax.</li>
             
         </ul>
     </div>
 	</div>
      </div>
    
         
         	<div id="index1_right" >
            <div id="show" style="clear:both;margin-left:100px; padding-top:20px;">
            </div>
         
      </div>
 </div>
 
<%@include file="usr_footer.jsp"%>
</body>

</html>