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
function validate()
{
	var vname = document.getElementById('vname').value.trim();
	var vtype = document.getElementById('vtype').value.trim();
	var rno = document.getElementById('rno').value.trim();
	var rate = document.getElementById('rate').value.trim();
	var capc = document.getElementById('capc').value.trim();
	var cost = document.getElementById('ccost').value.trim();
	var letters = /^[A-Za-z]+$/;
	var numbers = /^[0-9]+$/;
	var alpha = /^[0-9a-z]+$/;
	var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
	
	if (vname == "" || vname == null) 
	{
                alert("Enter Vehicle Name");
		return false;
        }
	else if (vname.length < 3) 
	{
            alert(" Vehicle Name Must be in 3 or more characters");
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
<title>Add Cars</title>

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
    <div id="contentmid">
     <div id="sub_menu"><u>Add Car Details:</u></div>
     <form action="" method="post" enctype="multipart/form-data" name="form1">
       <table width="500" height="288" border="0" align="center" cellpadding="5" class="t1">
         <tr>
           <td>Vehicle Name:</td>
           <td><label for="vname"></label>
           <input type="text" name="vname" id="vname"></td>
         </tr>
         <tr>
           <td>Vehicle Type:</td>
            <td><select name="vtype" id="vtype" style="width:150px;"/>
                <option value="select" >Select</option>
              <option value="Sedan">Sedan</option>
              <option value="SUV">SUV</option>
              <option value="Hatchback">Hatchback</option>
              
            </select></td>
         </tr>
         <tr>
           <td>Register No:</td>
           <td><label for="rno"></label>
           <input type="text" name="rno" id="rno"></td>
         </tr>
         <tr>
           <td>Rate/Km:</td>
           <td><label for="rate"></label>
           <input type="text" name="rate" id="rate"></td>
         </tr>
         <tr>
           <td>Capacity:</td>
           <td><label for="capc"></label>
           <input type="text" name="capc" id="capc"></td>
         </tr>
         <tr>
           <td>Car Cost:</td>
           <td><label for="capc"></label>
           <input type="text" name="ccost" id="ccost"></td>
         </tr>
         <tr>
           <td>Image:</td>
           <td><label for="carimg"></label>
           <input type="file" name="carimg" id="carimg"></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td><input type="submit" name="Submit" id="Submit" onclick="return validate()" value="Submit" 
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;" /> 
               <input type="submit" name="reset" id="Submit2" value="Reset"
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;" /></td>
         </tr>
    
 <%! String vname="",vtype="",rno="",rate="",capct="",routeid="",filename="",itemName1="",ccost=""; %>
  
   </table>
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
            String value=item.getString();
           
                 if(itemName1.equals("vname")) 
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
                    filename="default.png";
                }
                else if(type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif") && size<400)
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
   
                    if(itemName1.equals("Submit"))
              {
              
              String path2="jdbc:mysql://localhost/";
              String place="ecab";
              
              Class.forName("com.mysql.jdbc.Driver");
              Connection mycon1;
              Random rand = new Random();
              int n = (rand.nextInt(900) + 100);
              String track=String.valueOf(n);
              try
              {
                  
                  mycon1=DriverManager.getConnection(path2+place,"root","");
                  
                  try
                  {
                      String query ="insert into cabs values(?,?,?,?,?,?,?,?,?)";
                    PreparedStatement myst=mycon1.prepareStatement(query);
                            myst.setString(1,vname);
                            myst.setString(2,vtype);
                            myst.setString(3,rno);
                            myst.setString(4,rate);
                            myst.setString(5,capct);
                            myst.setString(6,track);
                            myst.setString(7,filename);
                             myst.setString(8,ccost);
                              myst.setString(9,"0");
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
             
   }
%>    
     </form>
    </div>
   
    <div id="content2">
        
    </div>
    
  <%@include file="ad_footer.jsp" %>

</body>

</html>