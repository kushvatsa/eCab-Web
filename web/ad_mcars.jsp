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
function validate1()
{
	var vname1 = document.getElementById('vname1').value.trim();
	var vtype = document.getElementById('vtype').value.trim();
	var rno = document.getElementById('rno').value.trim();
	var rate = document.getElementById('rate').value.trim();
	var capc = document.getElementById('capc').value.trim();
	var cost = document.getElementById('ccost').value.trim();
	var letters = /^[A-Za-z]+$/;
	var numbers = /^[0-9]+$/;
	var alpha = /^[0-9a-z]+$/;
	var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
	
	if(vname1 == "select") 
	{
                alert("Select Vehicle Name");
		return false;
        }
	else if(vname1.length <=0) 
	{
            alert("Select Vehicle Name");
            return false;
        }

		
		if (vtype == "" || vtype == null) 
	{
                alert("Enter Vehicle type");
		return false;
        }
	else if (vtype.length < 2) 
	{
            alert(" Vehicle type Must be in 3 or more characters");
            return false;
        }

	
		
			if (rno== "" || rno== null) 
	{
            alert("Enter Register Number");
            return false;
    	}
	
	else if (rno.length <1) 
	{
            alert("Register Number Must be greater than 2 characters");
            return false;
        }

		if (rate== "" || rate== null) 
	{
            alert("Enter Rate");
            return false;
    	}
	else if (!rate.match(numbers)) 
	{
            alert("Enter Valid Rate");
            return false; 
	}
	
		if (capc== "" || capc== null) 
	{
            alert("Enter capacity of vehicle");
            return false;
    	}
	
	else if (capc.length <1) 
	{
            alert("capacity Number Must be in 1 character only");
            return false;
        }

	else if (!capc.match(numbers)) 
	{
            alert("Enter Valid capacity number");
            return false; 
	}
        
		if (cost== "" || cost== null) 
	{
            alert("Enter Cost");
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
           

            return true;
        }
    </script>
</head>

<body onload=" return sizeshow();" onresize="return sizeshow();">

   <%!  String un1="", un2="", un3="" , un4="" , un5="" , un6="" , un7="pic.jpg",un8=""; %>
   <%! String vname="",vtype="",rno="",rate="",capct="",routeid="",filename="",itemName1="",value="",Status="",ccost=""; %>
   <%! ResultSet myrs11;%>
  <%@include file="header.jsp"%>
  <%@include file="content1.jsp" %>
    <div id="contentmid">
     
                            <%
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if(isMultipart)
    {
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    List items = null;
    
   try
   {
      
   items = upload.parseRequest(request);
   }
   catch (FileUploadException e)
   {
       e.printStackTrace();
   }
   Iterator itr = items.iterator();
   while (itr.hasNext())
   {
       
   FileItem item = (FileItem) itr.next();
     
        if (item.isFormField())
        {
             itemName1 = item.getFieldName();
           value=item.getString();
           
                 if(itemName1.equals("vname1")) 
           {
                vname=value;
                
           }
                 if(itemName1.equals("vtype")) 
           {
                vtype=value;
                
           }
                  if(itemName1.equals("rno")) 
           {
                rno=value;
                
           }
                    if(itemName1.equals("rate")) 
           {
                rate=value;
                
           }
                      if(itemName1.equals("capc")) 
           {
                capct=value;
                
           }
                       if(itemName1.equals("ccost")) 
           {
                ccost=value;
                
           }
                   
           
        }
        else
        {  
            
                String type=item.getContentType();
                long size=item.getSize()/1024; //bytes
                
              if(size==0)
                {
                    filename=un7;
                }
                else if(type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif") && size<100)
                    {
                        
               java.util.Date obj=new java.util.Date();
                SimpleDateFormat myformat=new SimpleDateFormat("ddMMyyyyhhmmss");
                String newdate=myformat.format(obj);
              
                 filename=newdate+item.getName();
                String path=config.getServletContext().getRealPath("/") + "/cabimg/" +filename;
                File savefile=new File(path);
                item.write(savefile);
              
                
                }
                else
                    {
                        out.println("Sorry only pictures are allowed to upload");
                    }
        }
   }
    }
                   
                            String path2="jdbc:mysql://localhost/";
                             String place="ecab";
                               //  String vname1="Datsun";
                               Class.forName("com.mysql.jdbc.Driver");
                                     Connection mycon1;
                                    try
                                         {
                  
                                       mycon1=DriverManager.getConnection(path2+place,"root","");
                                              try
                                                    {
                                        String query ="select * from cabs where vehiclename=? ";
                                     PreparedStatement myst=mycon1.prepareStatement(query);
                                           myst.setString(1,vname);
                                             ResultSet myrs= myst.executeQuery();

                                                    if(myrs.next())
                                                    {
                                             un1 = myrs.getString("vehiclename");    
                                             un2 = myrs.getString("type");
                                             un3 = myrs.getString("registerno");
                                             un4 = myrs.getString("ratekm");
                                             un5 = myrs.getString("capacity");
                                           //  un6 = myrs.getString("route_id");
                                             un7=  myrs.getString("cab_image");
                                             un8=myrs.getString("car_cost");
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
                                
                                   
                                    
                                    
                                     if(itemName1.equals("update"))
                                                {
                                                    String path= "jdbc:mysql://localhost:3306/ecab";
                                                    Connection mycon;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        mycon = DriverManager.getConnection(path,"root","");
                                                        String query ="update cabs set vehiclename=?,type=?,registerno=?,ratekm=?,capacity=?,cab_image=?,car_cost=? where vehiclename=?";


                                                        try{
                                                            PreparedStatement myst=mycon.prepareStatement(query);
                                                            myst.setString(1,vname);
                                                            myst.setString(2,vtype);
                                                            myst.setString(3,rno);
                                                            myst.setString(4,rate);
                                                            myst.setString(5,capct);
                                                           // myst.setString(6,routeid);
                                                            myst.setString(6,filename);
                                                             myst.setString(7,ccost);
                                                             myst.setString(8,vname);

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
                                                     un1=""; un2=""; un3="";un4=""; un5="";un6=""; un7="pic.jpg";un8=""; 
                                                }
                                     
                                                              if(itemName1.equals("Delete"))
                                                                     {
                                                    String path= "jdbc:mysql://localhost:3306/ecab";
                                                    Connection mycon;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        mycon = DriverManager.getConnection(path,"root","");
                                                        String query ="Delete from cabs where vehiclename=?";

                                                        try{
                                                            PreparedStatement myst=mycon.prepareStatement(query);
                                                            myst.setString(1,vname);
                                                          
                                                            int i= myst.executeUpdate();

                                                            if(i>0)
                                                            {
                                                                out.println("<td>Data Deleted</td>");
                                                            }
                                                            else{
                                                               out.println("<td>Data Not Deleted</td>");
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
                                                     un1=""; un2=""; un3="";un4=""; un5="";un6=""; un7="pic.jpg";un8=""; 
                                            }
                                                              
                                                              if(itemName1.equals("reset"))
                                                {
                                           un1=""; un2=""; un3="";un4=""; un5="";un6=""; un7="pic.jpg";un8="";    
                                          //response.sendRedirect("ad_mcars.jsp?id1=null");
                                                }
%>  
<%                                                            
    if(request.getParameter("id1")!=null)
    {
                       String path3="jdbc:mysql://localhost/ecab";
                             
                               //  String vname1="Datsun";
                               Class.forName("com.mysql.jdbc.Driver");
                                     Connection mycon2;
                                    try
                                         {
                  
                                       mycon2=DriverManager.getConnection(path3,"root","");
                                              try
                                                    {
                                        String query ="select * from cabs where vehiclename=? ";
                                     PreparedStatement myst=mycon2.prepareStatement(query);
                                           myst.setString(1,request.getParameter("id1"));
                                             ResultSet myrs= myst.executeQuery();

                                                    if(myrs.next())
                                                    {
                                             un1 = myrs.getString("vehiclename");    
                                             un2 = myrs.getString("type");
                                             un3 = myrs.getString("registerno");
                                             un4 = myrs.getString("ratekm");
                                             un5 = myrs.getString("capacity");
                                            // un6 = myrs.getString("route_id");
                                             un7=  myrs.getString("cab_image");
                                            un8=myrs.getString("car_cost");
                                                    }
                           
                                            }
                                            catch(Exception e)
                                              {
                                                  out.println("Error in Query " + e.getMessage());
                                              }
                                            finally
                                            {
                                                mycon2.close();
                                            }
                                        }
                                        catch(Exception e)
                                         {
                                            out.println("Error in Connection " + e.getMessage());
                                                 }
                                   
    }
                                 
                                                              
%>  

 <%        
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from cabs ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                         myrs11 = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %>
                               <div id="sub_menu"><u>Manage Car Details:</u></div>
     <div style=" clear:both; width:650px; float:left;">
         
     <form action="" method="post" enctype="multipart/form-data" name="form1">
       <table width="500" height="288" border="0" align="center" cellpadding="5" class="t1">
         <tr>
           <td>Vehicle Name:</td>
           <td><label for="vname"></label>
               <select name="vname1" id="vname1">
             <option value="select" selected>Select</option>
                 <% if(myrs11.next())
             { 
                 do
                 {
                     if(un1.equals(myrs11.getString("vehiclename")))
                     {
                         out.println("<option Selected>"+myrs11.getString("vehiclename")+"</option>");
                     }
                     else
                     {
                         out.println("<option>"+myrs11.getString("vehiclename")+"</option>");
                     }
                 }while(myrs11.next());
                 
             }   
                 %>
                 
                 </select>
                   <input type="submit" name="show" id="Submit" value="Show"></td>
   
         </tr>
         <tr>
           <td>Vehicle Type:</td>
           <td><label for="vtype"></label>
               <input type="text" name="vtype" id="vtype" value="<% out.print(""+un2+""); %>"></td>
         </tr>
         <tr>
           <td>Register No:</td>
           <td><label for="rno"></label>
               <input type="text" name="rno" id="rno" value="<% out.print(""+un3+""); %>"></td>
         </tr>
         <tr>
           <td>Rate/Km:</td>
           <td><label for="rate"></label>
               <input type="text" name="rate" id="rate" value="<% out.print(""+un4+""); %>"></td>
         </tr>
         <tr>
           <td>Capacity:</td>
           <td><label for="capc"></label>
               <input type="text" name="capc" id="capc" value="<% out.print(""+un5+""); %>"></td>
         </tr>
           <tr>
           <td>Car Cost:</td>
           <td><label for="capc"></label>
               <input type="text" name="ccost" id="ccost" value="<% out.print(""+un8+""); %>"></td>
         </tr>
        
         <tr>
           <td>Image:</td>
           <td><label for="carimg"></label>
               <input type="file" name="carimg" id="carimg" src="<% out.print(""+un7+""); %>"></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td><input type="submit" name="update" id="update" onclick="return validate1()" value="Update"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
           <input type="submit" name="reset" id="reset"  value="Reset"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
             <input type="submit" name="Delete" id="Delete" value="Delete" onclick="javascript: return confirm('Please confirm deletion');"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"></td>
         </tr>
      
       
 </table>
  
        
      </div>
      <div style=" width:350px; float:left;">
        <table width="350" height="226" border="0" cellpadding="5" cellspacing="5">
          <tr>
            <td width="350"><img src="cabimg/<% out.print(""+un7+""); %>" width="450" height="280"></td>
          </tr>
        </table>
      </div>
      </form>
        
    </div>
          
   
  <%@include file="ad_footer.jsp" %>

</body>

</html>