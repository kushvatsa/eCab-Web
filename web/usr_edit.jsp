
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
<script type="text/javascript" src="js/fancybox/fancy_script.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/fancy_css.css">
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/jquery.fancybox.css">
<script type="text/javascript">
        $(document).ready(function(){
			 $("#cp1").click(function()
           { 
  $("#cp1").fancybox({
      'autoSize':false,
    'width'  : 650,           // set the width
    'height' : 300,           // set the height
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
   if(session.getAttribute("userid")==null)
   {
       response.sendRedirect("welcome_ecab.jsp");
   }
   
   %>
<script language="javascript" type="text/javascript">
function validate1()
{
	var name = document.getElementById('name').value.trim();
	var email = document.getElementById('email').value.trim();
	var pwd = document.getElementById('pwd').value.trim();
	var rpwd = document.getElementById('rpwd').value.trim();
	var male = document.getElementById('male').checked;
        var female = document.getElementById('female').checked;
	var mno = document.getElementById('mno').value.trim();
	var addr = document.getElementById('addr').value.trim();
        var letters = /^[A-Za-z]+$/;
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var numbers = /^[0-9]+$/;
		var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
 
	if (name == "" || name == null) 
	{
        alert("Enter Name");
		return false;
    }
	else if (name.length < 3) 
	{
      alert("Name Must be in 3 or more characters");
	  return false;
    }

	else if (!name.match(alphaspace)) 
	{
      alert("Enter characters only in Name");
	  return false;    
    }
	
	if (email == "" || email == null) 
	{
        alert("Enter Email");
		return false;
    }

	else if (!email.match(mailformat)) 
	{
      alert("Enter Valid Email Address");
	  return false;    
    }
	
	if (pwd == "" || pwd == null) 
	{
      alert("Enter Password");
	  return false;       
    } 
	else if (pwd.length <= 5) 
	{
      alert("Password Must be in 6 or more characters");
	  return false;
    }
	if(pwd != rpwd)
    {
      alert("Password doesn\'t match");
	  return false;
    }
	
	if (male == false && female == false)  {
        alert("Select Gender");
		return false;
    }
	
		if (mno == "" || mno== null) 
	{
        alert("Enter Mobile Number");
		return false;
    }
	else if (mno.length == 9) 
	{
      alert("Mobile Number Must be in 10 characters");
	  return false;
    }

	else if (!mno.match(numbers)) 
	{
      alert("Enter Valid Mobile Number");
	  return false;    
    }
	
	if (addr == "" || addr == null) 
	{
        alert("Enter Address");
		return false;
    }
	else if (addr.length >= 100) 
	{
      alert("Address limit Exceeds");
	  return false;
    }
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Edit Profile</title>

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

    <%!  String un1="" , un2="", un3="" , un4="" , un5="" ,un6="";%>
    <%! String uname="",gender="",mob="",addre="",filename="",itemName1="" ; %>
  <%@include file="header.jsp"%>
  <%@include file="contentusr1.jsp" %>
  
    <div id="contentmid">
    <div id="sub_menu"><u>Edit Profile:</u></div>
        <%        
                     
                        if(session.getAttribute("userid")!=null)
                    {
            
                    String name1 = session.getAttribute("userid").toString();    
                   
                       
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    //  String place="courierdb";
                    Connection mycon;
                         
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from user where name=?";
                         

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name1);          
                      ResultSet myrs = myst.executeQuery();
                            
                            if(myrs.next())
                            {
                             un1 = myrs.getString("name");    
                            un2 = myrs.getString("email");
                              un3 = myrs.getString("gender");
                            un4 = myrs.getString("mobile");
                            un5 = myrs.getString("addr");
                            un6= myrs.getString("image");
                            
                            }
                            else{
                                response.sendRedirect("ad_edit.jsp");
                               out.println("</div>" +
                            "<tr><td><div style='clear:both; margin-left:5px; color:Red;'>Details Not Shown</div></td></tr>");
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
     <form action="" method="post" enctype="multipart/form-data" name="form1">
    
     <table width="792" height="490" border="0" cellpadding="5" cellspacing="5" class="t1">
       <tr>
         <td width="272" valign="top"><table width="200" height="171" border="0" align="center" cellpadding="5" cellspacing="5">
           <tr>
               
             <td align="center" width="180px" height="230px"><img src="userimg/<% out.print(""+un6+""); %>" width="180" height="240"></td>
           </tr>
         </table></td>
         <td width="485" valign="top"><table width="400" height="308" border="0" align="center" cellpadding="5" cellspacing="5">
           <tr>
             <td width="200">Name:</td>
             <td width="200"><label for="u_email"></label>
               <label for="name"></label>
               <input type="text" name="name" id="name" value="<% out.print(""+un1+""); %>">
<label for="email"></label></td>
           </tr>
           <tr>
             <td>Email:</td>
             <td><label for="uname"></label>
               <label for="email"></label>
               <input type="text" name="email" id="email" value="<% out.print(""+un2+""); %>" disabled>
              <label for="name"></label></td>
           </tr>
           <tr>
             <td>Gender:</td>
             <td>
               <label>
                 <input type="radio" name="gender" value="male" id="male" <% if(un3.equalsIgnoreCase("male")) out.print("checked=checked");  %>>
                 Male</label>
               <label>
                 <input type="radio" name="gender" value="female" id="female"<% if(un3.equalsIgnoreCase("female")) out.print("checked=checked");  %>>
                 Female</label>
              </td>
           </tr>
           <tr>
             <td>Mobile No:</td>
             <td><label for="mno"></label>
                 <input type="text" name="mno" id="mno" value="<% out.print(""+un4+""); %>"></td>
           </tr>
           <tr>
             <td>Address:</td>
             <td><label for="addr"></label>
              <textarea name="addr" cols="30" rows="8" id="addr"><% out.print(""+un5+""); %></textarea></td>
           </tr>
           <tr>
              
             <td>Image:</td>
             <td><label for="img"></label>
              <input type="file" name="img" id="img"></td>
           </tr>
           <tr>
             <td>&nbsp;</td>
             <td align="right" valign="bottom" class="hf">
             <a class="fancybox fancybox.iframe" id="cp1" href="changepwd3.jsp">Change Password</a>
             </td>
           </tr>
           <tr>
             <td>&nbsp;</td>
             <td><input type="submit" name="update" id="update" onclick="return validate1();" value="Update"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"></td>
           </tr>
           <tr>
             <td>&nbsp;</td>
             <td>
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
          
            if(itemName1.equals("name")) 
           {
                uname=value;
                
           }
             if(itemName1.equals("gender")) 
           {
                gender=value;
               
           }
              if(itemName1.equals("mno")) 
           {
                mob=value;
               
           }
               if(itemName1.equals("addr")) 
           {
                addre=value;
               
           }
                
        }
        else
        {  
            
                String type=item.getContentType();
                long size=item.getSize()/1024; //bytes
                
              if(size==0)
                {
                    filename=un6;
                }
                else if(type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif") && size<400)
                    {
                        
               java.util.Date obj=new java.util.Date();
                SimpleDateFormat myformat=new SimpleDateFormat("ddMMyyyyhhmmss");
                String newdate=myformat.format(obj);
              
                 filename=newdate+item.getName();
                String path=config.getServletContext().getRealPath("/") + "/userimg/" +filename;
                File savefile=new File(path);
                item.write(savefile);
              
                
                }
                else
                    {
                        out.println("Sorry only pictures are allowed to upload");
                    }
        }
   }
                    if(itemName1.equals("update"))
              {
              
              String path2="jdbc:mysql://localhost/";
              String place="ecab";
              
              Class.forName("com.mysql.jdbc.Driver");
              Connection mycon1;
              try
              {
                  
                  mycon1=DriverManager.getConnection(path2+place,"root","");
                  
                  try
                  {
                    String query ="update user set name=?,gender=?,mobile=?,addr=?,image=? where email=?";
              PreparedStatement myst=mycon1.prepareStatement(query);
                        myst.setString(1,uname);
                        myst.setString(2,gender);
                        myst.setString(3,mob);
                        myst.setString(4,addre);
                         myst.setString(5,filename);
                          myst.setString(6,session.getAttribute("email").toString());
                    myst.executeUpdate();
                    out.println("<p style='color:green;'>Update Successful</p>");
                   
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
              else
              {
                   out.println("Data not Updated");
              }
   }
   
%> 
</td>
           </tr>
         </table></td>
       </tr>
             
     </table>
     </form>   
    </div>
   
    
  <%@include file="usr_footer.jsp" %>
 <%
     if(request.getParameter("msg")!=null)
                    {
                      out.println("<script>alert('Password Changed')</script>");
                   //out.println("Password Changed");
                    }
     if(request.getParameter("msg1")!=null)
                    {
                      out.println("<script>alert('Password Not Changed')</script>");
                   //out.println("Password Changed");
                    }
    %>
</body>
 
</html>