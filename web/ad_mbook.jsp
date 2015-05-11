<%@page import="java.text.DateFormat"%>
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
 <script language="javascript" type="text/javascript"> 
function validatexx()
		{
			var tn = document.getElementById('track').value.trim();
			var fname = document.getElementById('fname').value.trim();
			var dname = document.getElementById('dname').value.trim();
			var dlice = document.getElementById('dlice').value.trim();
                        var vna = document.getElementById('vna').value.trim();
			var vno = document.getElementById('vno').value.trim();
			var rate = document.getElementById('rate').value.trim();
			var pare = document.getElementById('pare').value.trim();
			var dropa = document.getElementById('dropa').value.trim();
			var dpi = document.getElementById('dpi').value.trim();
			var bill = document.getElementById('bill').value.trim();
			var cash = document.getElementById('cash').value.trim();
			var letters = /^[A-Za-z]+$/;
			var numbers = /^[0-9]+$/;
			var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
			
	if(tn == "select") 
                {
                 alert("Select Track Number");
		return false;
                 }
	else if(tn.length <=0)
		{
			alert("Select Track Number");
			return false;
		}
	
	if (fname == "" || fname == null) 
	{
        alert("Enter User Name");
		return false;
    }

	
	if (dname == "" || dname == null) 
	{
        alert("Enter Driver Name");
		return false;
    }

	
	
	if (dlice == "" || dlice == null) 
	{
        alert("Enter Licence Number");
		return false;
    }

	if (vna == "" || vna == null) 
	{
        alert("Enter Vehicle Name");
		return false;
    }
	

	if (vno== "" || vno== null) 
	{
            alert("Enter Vehicle Number");
            return false;
    	}
		if (rate== "" || rate== null) 
	{
            alert("Enter Rate");
            return false;
    	}
	if (pare == "" || pare == null) 
	{
        alert("Enter Pickup Area");
		return false;
    }

	else if (!pare.match(letters)) 
	{
      alert("Enter characters only in Pickup Area");
	  return false;    
    }
	
		if (dropa == "" || dropa == null) 
	{
        alert("Enter Drop Area");
		return false;
    }

	else if (!dropa.match(letters)) 
	{
      alert("Enter characters only in Drop Area");
	  return false;    
    }
	if (dpi == "" || dpi == null) 
	{
        alert("Enter Date");
		return false;
    }
	if (bill== "" || bill== null) 
	{
            alert("Enter Bill");
            return false;
    	}
	
	else if (!bill.match(numbers)) 
	{
            alert("Enter Valid Bill Data");
            return false; 
	}
	if (cash == "" || cash == null) 
	{
        alert("Enter Cash");
		return false;
    }
	
    }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Manage Employee</title>

<script language="javascript" type="text/javascript">
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
<%!  String un1="", un2="", un3="" , un4="" , un5="" , un6="" , un7="",un8="" , un9="" , un10="",un11="",un12="",un13="",un14="pic.jpg",un15="pic.jpg",un16="",un21="" ; %>
 <%! ResultSet myrs11;%>
  <%@include file="header.jsp"%>
  <%@include file="content1.jsp" %>
    <div id="contentmid">
       <%        
            if(request.getParameter("Submit21")!=null)
            {
                    String name = request.getParameter("track");    
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking where track_no=?";
                          

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name);          
                      ResultSet myrs = myst.executeQuery();
                            
                            if(myrs.next())
                            {
                               
                             un1 = myrs.getString("track_no");    
                            un2 = myrs.getString("user_name");
                            un3 = myrs.getString("driver_name");
                            un4 = myrs.getString("driver_liceno");
                            un5 = myrs.getString("veh_name");
                            un6 = myrs.getString("veh_regno");
                            un7=  myrs.getString("rate_km");
                              un8=  myrs.getString("pick_area");
                                un9=  myrs.getString("drop_area");
                                
                                  un10= myrs.getString("pick_date");
                                    un11=  myrs.getString("Status");
                                      un12=  myrs.getString("bill");
                                        un13=  myrs.getString("cash");
                                         un14=  myrs.getString("dri_image");
                                         un15=  myrs.getString("usr_img");
                                         un16=  myrs.getString("driver_id");
                                          un21=  myrs.getString("cab_id");
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
            if(request.getParameter("reset")!=null)
                        {
               un1=""; un2=""; un3="" ; un4="" ; 
               un5="" ; un6="" ; un7="";un8="" ; 
               un9="" ; un10="";un11="";un12="";un13="";
               un14="pic.jpg";un15="pic.jpg";un16="";un21="";
               response.sendRedirect("ad_mbook.jsp");
            }
                                
                             
        
                if(request.getParameter("update")!=null)
                {
                    String tra=request.getParameter("track");
                    String una=request.getParameter("fname");
                    String dna=request.getParameter("dname");
                    String dlic=request.getParameter("dlice");
                    String vna=request.getParameter("vna");
                    String vno=request.getParameter("vno");
                    String ratk=request.getParameter("rate");
                    String par=request.getParameter("pare");
                    String dar=request.getParameter("dropa");
                    String date1=request.getParameter("dpi");
                    String bil=request.getParameter("bill");
                    String cas=request.getParameter("cash");
                     String path= "jdbc:mysql://localhost:3306/ecab";
                               Connection mycon;

                                  try {
                                         Class.forName("com.mysql.jdbc.Driver");
                                          mycon = DriverManager.getConnection(path,"root","");
                                           String query ="Update booking set user_name=?,driver_name=?,driver_liceno=?,veh_name=?,veh_regno=?, rate_km=? ,pick_area=?,drop_area=?,pick_date=?,bill=?,cash=? where track_no=?";
                                                        try{
                                                            PreparedStatement myst=mycon.prepareStatement(query);
                                                           myst.setString(1,una);
                                                    myst.setString(2,dna);
                                                    myst.setString(3,dlic);
                                                    myst.setString(4,vna);
                                                    myst.setString(5,vno);
                                                     myst.setString(6,ratk);
                                                    myst.setString(7,par);
                                                    myst.setString(8,dar);
                                                    myst.setString(9,date1);
                                                    myst.setString(10,bil);
                                                    myst.setString(11,cas);
                                                    myst.setString(12,tra);
                                                      
                                        

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
                                                   un1=""; un2=""; un3="" ; un4="" ; 
                                                   un5="" ; un6="" ; un7="";un8="" ; 
                                                   un9="" ; un10="";un11="";un12="";
                                                   un13="";un14="pic.jpg";un15="pic.jpg";
                                               un16="";un21="";
                }            
                
                if(request.getParameter("Delete")!=null)
                {
                     String path= "jdbc:mysql://localhost:3306/ecab";
                                                    Connection mycon;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        mycon = DriverManager.getConnection(path,"root","");
                                                        String query ="Delete from booking where track_no=?";
                                                         String query1 ="Delete from cabstatus set  where cab_id =? and date=? ";
                                                            String query2 ="Delete from driverstatus where driver_id =? and date=?";
                                                        try{
                                                            PreparedStatement myst=mycon.prepareStatement(query);
                                                            PreparedStatement myst1=mycon.prepareStatement(query1);
                                                             PreparedStatement myst2=mycon.prepareStatement(query2);
                                                            myst.setString(1,request.getParameter("track"));
                                                         
                                                            myst1.setString(1,un21);
                                                             myst2.setString(2,un10);
                                                              
                                                            myst2.setString(1,un16);
                                                             myst2.setString(2,un10);
                                                            int i= myst.executeUpdate();
                                                                 int j= myst1.executeUpdate();
                                                                     int k= myst2.executeUpdate();
                                                             if(i>0 && j>0&& k>0)
                                                            {
                                                                out.println("<td><font color='red'>Record Deleted</td>");
                                                            }
                                                            else{
                                                               out.println("<td>Record Not Deleted</td>");
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
                                  un1=""; un2=""; un3="" ; un4="" ;
                                  un5="" ; un6="" ; un7="";un8="" ; un9="" ; 
                                  un10="";un11="";un12="";un13="";
                                  un14="pic.jpg";un15="pic.jpg";un16="";un21="";
                                            }   
                if(request.getParameter("id1")!=null)
            {
                   
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking where track_no=?";
                          

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,request.getParameter("id1"));          
                      ResultSet myrs = myst.executeQuery();
                            
                            if(myrs.next())
                            {
                               
                             un1 = myrs.getString("track_no");    
                            un2 = myrs.getString("user_name");
                            un3 = myrs.getString("driver_name");
                            un4 = myrs.getString("driver_liceno");
                            un5 = myrs.getString("veh_name");
                            un6 = myrs.getString("veh_regno");
                            un7=  myrs.getString("rate_km");
                              un8=  myrs.getString("pick_area");
                                un9=  myrs.getString("drop_area");
                                
                                  un10= myrs.getString("pick_date");
                                    un11=  myrs.getString("Status");
                                      un12=  myrs.getString("bill");
                                        un13=  myrs.getString("cash");
                                         un14=  myrs.getString("dri_image");
                                         un15=  myrs.getString("usr_img");
                                       
                            }
                            else{
                                response.sendRedirect("ad_home.jsp");
                              
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
             
          
       <%        
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from booking  ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                         myrs11 = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %> 
<div id="sub_menu"><u>Manage Bookings:</u></div>
        <div style=" clear:both; width:650px; float:left;">
      <form action="" method="post"  name="form1" id="form1">
        <table width="500" height="449px" border="0" align="center" cellpadding="5" class="t1">
          <tr>
               <td width="153">Track No:</td>
            <td width="312">
                <select name="track" id="track">
             <option value="select" selected>Select</option>
                 <% if(myrs11.next())
             { 
                 do
                 {
                     if(un1.equals(myrs11.getString("track_no")))
                     {
                         out.println("<option Selected>"+myrs11.getString("track_no")+"</option>");
                     }
                     else
                     {
                         out.println("<option>"+myrs11.getString("track_no")+"</option>");
                     }
                 }while(myrs11.next());
                 
             }   
                 %>
                 
                 </select>
            <input type="submit" name="Submit21" id="Submit21" value="Show"></td>
           
          </tr>
          <tr>
            <td>User Name:</td>
            <td><label for="fname"></label>
                <input type="text" name="fname" id="fname" value="<% out.print(""+un2+""); %>" /></td>
          </tr>
          <tr>
            <td>Driver Name:</td>
            <td>  <input type="text" name="dname" id="dname" value="<% out.print(""+un3+""); %>"></td>
          </tr>
          <tr>
            <td>Driver licence:</td>
            <td>
              <input type="text" name="dlice" id="dlice" value="<% out.print(""+un4+""); %>">
            </td>
          </tr>
         
          <tr>
            <td>Vehicle Name:</td>
            <td>
             <input type="text" name="vna" id="vna" value="<% out.print(""+un5+""); %>">
            </td>
          </tr>
          <tr>
            <td>Vehicle No:</td>
            <td><label for="vno"></label>
                <input type="text" name="vno" id="vno" value="<% out.print(""+un6+""); %>"/></td>
          </tr>
           <tr>
            <td>Rate/km:</td>
            <td><label for="rate"></label>
                <input type="text" name="rate" id="rate" value="<% out.print(""+un7+""); %>"/></td>
          </tr>
          <tr>
            <td>Pickup Area:</td>
            <td><label for="addr"></label>
            <input type="text" name="pare" id="pare" value="<% out.print(""+un8+""); %>"/></td>
          </tr>
          <tr>
            <td>Drop Area:</td>
            <td><label for="cno"></label>
                <input type="text" name="dropa" id="dropa" value="<% out.print(""+un9+""); %>"/></td>
          </tr>
           <tr>
            <td>Pickup Date:</td>
            <td><label for="dob"></label>
                <input type="text" name="dpi" id="dpi"value="<% out.print(""+un10+""); %>" /></td>
          </tr>
          <tr>
            <td>Status:</td>
            <td><label for="status"></label>
                <input type="text" name="status" id="status"  value="<% out.print(""+un11+""); %>"disabled></td>
            <td>          
          </tr>
           <tr>
            <td>Bill:</td>
            <td><label for="status"></label>
                <input type="text" name="bill" id="bill" value="<% out.print(""+un12+""); %>"></td>
            <td>          
          </tr>
           <tr>
            <td>Cash:</td>
            <td><label for="status"></label>
                <input type="text" name="cash" id="cash"value="<% out.print(""+un13+""); %>" ></td>
            <td>          
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="update" id="update" value="Update" onclick="return validatexx();" 
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
             <input type="submit" name="reset" id="reset" value="Reset" 
                              style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
             <input type="submit" name="Delete" id="Delete" value="Delete" onclick="javascript: return confirm('Please confirm deletion');"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"></td>
            </td>
            </tr>
               
        </table>
         
      
      </div>
      
      <div style=" width:350px; float:left;">
        <table width="350" height="400" border="0" cellpadding="5" cellspacing="5">
          <tr>
            <td width="350"><img src="userimg/<% out.print(""+un15+""); %>" width="180" height="200" alt="User Pic">
            <div style="clear:both">User Pic</div></td>
          </tr>
          <tr>
            <td width="350"><img src="driverimg/<% out.print(""+un14+""); %>" width="180" height="200" alt="Driver Pic">
            <div style="clear:both;">Driver Pic</div></td>
          </tr>
        </table>
      </div>
      </form>
    </div>
   
  <%@include file="ad_footer.jsp" %>

</body>

</html>