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
		
function validate()
		{
			var name = document.getElementById('name').value.trim();
			var fname = document.getElementById('fname').value.trim();
			var qual = document.getElementById('qual').value;
			var male = document.getElementById('male').checked;
                        var female = document.getElementById('female').checked;
			var dob = document.getElementById('dob').value.trim();
			var vyes = document.getElementById('vreq_0').checked;
                        var vno = document.getElementById('vreq_1').checked;
			var lno = document.getElementById('lno').value.trim();
			var addr = document.getElementById('addr').value.trim();
			var cno = document.getElementById('cno').value.trim();
			var em = document.getElementById('email').value.trim();
	        var pwd = document.getElementById('pass').value.trim();
			var sal = document.getElementById('sal').value.trim();
			var letters = /^[A-Za-z]+$/;
			var numbers = /^[0-9]+$/;
			var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
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
	
	if (fname == "" || fname == null) 
	{
                alert("Enter Name");
		return false;
        }
	else if (fname.length < 3) 
	{
            alert("Name Must be in 3 or more characters");
            return false;
        }

	else if (!fname.match(alphaspace)) 
	{
            alert("Enter characters only in Name");
            return false;    
        }
		
		if(qual.length <=0)
		{
			alert("Select qualification");
			return false;
		}
		else if(qual == "select")
		{
			alert("Select qualification");
			return false;
		}
	
	if (male == false && female == false)  
        {
                alert("Select Gender");
		return false;
        }
		
	if (dob == "" || dob== null) 
	{
                alert("Enter Date of Birth");
		return false;
        }
	if (vyes == false && vno == false)  
        {
                alert("Select Vehicle Required");
		return false;
        }
	if (lno == "" || lno == null) 
	{
                alert("Enter Licence Number");
		return false;
        }
	else if (lno.length < 9) 
	{
            alert("Licence number Must be in 10 or more characters");
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
	
	if (cno == "" || cno== null) 
	{
                alert("Enter Contact Number");
		return false;
        }
	else if (cno.length == 9) 
	{
            alert("Contact Number Must be in 10 characters");
            return false;
        }

	else if (!cno.match(numbers)) 
	{
            alert("Enter Valid Contact Number");
            return false;    
        }
		if (em == "" || em == null) 
	{
        alert("Enter Email");
		return false;
        }

	else if (!em.match(mailformat)) 
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
		
		if (sal == "" || sal== null) 
	{
                alert("Enter Salary");
		return false;
        }
    }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add Employee</title>

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

   
  <%@include file="header.jsp"%>
  <%@include file="content1.jsp" %>
    <%! String uname="",gender="",mob="",addre="",filename="",itemName1="",route="",
            fname="", date1="", vreq="",lno="",qual="",email="",pass="",sal="" ; %>
  
    <div id="contentmid">
        <div id="sub_menu" style="height:20px;"><u>Add Employee Details:</u></div>
      <form action="" method="post" enctype="multipart/form-data" name="form1" id="form1">
        <table width="500" height="449px" border="0" align="center" cellpadding="4" class="t1">
          <tr>
            <td width="153">Name:</td>
            <td width="312"><label for="name"></label>
            <input type="text" name="name" id="name" /></td>
          </tr>
          <tr>
            <td>Father Name:</td>
            <td><label for="fname"></label>
            <input type="text" name="fname" id="fname" /></td>
          </tr>
          <tr>
            <td>Qualification:</td>
            <td><select name="qual" id="qual">
              <option value="select" selected="selected">Select</option>
              <option value="10th">10th</option>
              <option value="12th">12th</option>
              <option value="gr">Graduate</option>
            </select></td>
          </tr>
          <tr>
            <td>Gender:</td>
            <td>
              <label>
                <input type="radio" name="Gender" value="male" id="male" />
                Male</label>
              <label>
                <input type="radio" name="Gender" value="female" id="female" />
                Female</label>
            </td>
          </tr>
          <tr>
            <td>D.O.B</td>
            <td><label for="dob"></label>
            <input type="date" name="dob" id="dob" /></td>
          </tr>
          <tr>
            <td>Vehicle Required:</td>
            <td>
              <label>
                <input type="radio" name="vreq" value="yes" id="vreq_0" />
                Yes</label>
              <label>
                <input type="radio" name="vreq" value="no" id="vreq_1" />
                No</label>
            </td>
          </tr>
          <tr>
            <td>Licence No:</td>
            <td><label for="lno"></label>
            <input type="text" name="lno" id="lno" /></td>
          </tr>
          <tr>
            <td>Address:</td>
            <td><label for="addr"></label>
            <textarea name="addr" id="addr" cols="30" rows="4"></textarea></td>
          </tr>
          <tr>
            <td>Contact No:</td>
            <td><label for="cno"></label>
            <input type="text" name="cno" id="cno" /></td>
          </tr>
             <tr>
            <td>Email:</td>
            <td><label for="email"></label>
            <input type="text" name="email" id="email" /></td>
          </tr>
             <tr>
            <td>Password:</td>
            <td><label for="pass"></label>
            <input type="text" name="pass" id="pass" /></td>
          </tr>
             <tr>
               <td>Salary:</td>
               <td><label for="sal"></label>
               <input type="text" name="sal" id="sal"></td>
             </tr>
          <tr>
            <td>Image:</td>
            <td><label for="empimg"></label>
            <input type="file" name="empimg" id="empimg"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" id="Submit" onclick="return validate()" value="Submit" 
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;" /> 
            <input type="submit" name="Submit2" id="Submit2" value="Reset"
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;" /></td>
          </tr>
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
            
            
                 if(itemName1.equals("name")) 
           {
                uname=value;
                
           }
                 if(itemName1.equals("fname")) 
           {
                fname=value;
                
           }
                  if(itemName1.equals("qual")) 
           {
                qual=value;
                
           }
                    if(itemName1.equals("dob")) 
           {
                date1=value;
                
           }
                     if(itemName1.equals("vreq")) 
           {
                vreq=value;
                
           }
             if(itemName1.equals("Gender")) 
           {
                gender=value;
               
           }
              if(itemName1.equals("cno")) 
           {
                mob=value;
               
           }
               if(itemName1.equals("addr")) 
           {
                addre=value;
               
           }
                 if(itemName1.equals("lno")) 
           {
                lno=value;
               
           }
                   if(itemName1.equals("email")) 
           {
                email=value;
               
           }
                     if(itemName1.equals("pass")) 
           {
                pass=value;
               
           }
                      if(itemName1.equals("sal")) 
           {
                sal=value;
               
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
                String path=config.getServletContext().getRealPath("/") + "/driverimg/" +filename;
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
                        String pattern = "dd-MM-yyyy";
           String dateInString =new SimpleDateFormat(pattern).format(new java.util.Date());
                     
                       String query2 ="insert into allusers(email,password,typeid,account_date,authenticate) values(?,MD5(?),?,?,?)";
             
              PreparedStatement myst2=mycon1.prepareStatement(query2);
              
                 myst2.setString(1,email);
                  myst2.setString(2,pass);
                   myst2.setString(3,"Driver");
                  myst2.setString(4,dateInString);
                   myst2.setString(5,"Yes");
               
                int j= myst2.executeUpdate();
              if(j>0)
              {
                   String query ="insert into driver values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement myst=mycon1.prepareStatement(query);
                            myst.setString(1,email);
                            myst.setString(2,uname);
                            myst.setString(3,track);
                            myst.setString(4,fname);
                            myst.setString(5,qual);
                                        
                           String dateReceived =date1;
                        DateFormat userDateFormat = new SimpleDateFormat("yyyy-mm-dd");
                        DateFormat dateFormatNeeded = new SimpleDateFormat("dd-mm-yyyy");
                        java.util.Date date = userDateFormat.parse(dateReceived);
                        String cd = dateFormatNeeded.format(date);
                            myst.setString(6,gender);
                             myst.setString(7,cd);
                              myst.setString(8,vreq);
                            myst.setString(9,lno);
                            myst.setString(10,addre);
                            myst.setString(11,mob);
                            myst.setString(12,filename);
                             myst.setString(13,sal);
                             myst.setString(14,"0");
                            int i= myst.executeUpdate();

                            if(i>0)
                            {
                                out.println("<td>Details Saved</td>");
                            }
                            else{
                               out.println("<td>Details Not Saved<</td>");
                            }
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
   
    <div id="ad_content2">
        
    </div>
    
  <%@include file="ad_footer.jsp" %>

</body>

</html>