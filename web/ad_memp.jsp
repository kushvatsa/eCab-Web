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
	
function validate1()
		{
			var name1 = document.getElementById('name1').value.trim();
			var rid = document.getElementById('rid').value.trim();
			var fname = document.getElementById('fname').value.trim();
			var qual = document.getElementById('qual').value;
			var male = document.getElementById('male').checked;
            var female = document.getElementById('female').checked;
			var dob = document.getElementById('dob').value.trim();
			var vyes = document.getElementById('vreq_0').checked;
            var vno = document.getElementById('vreq_1').checked;
			var lno = document.getElementById('lno').value.trim();
			var addr = document.getElementById('addr').value.trim();
			var em = document.getElementById('email').value.trim();
			var sal = document.getElementById('sal').value.trim();
			var cno = document.getElementById('cno').value.trim();
                        
			var letters = /^[A-Za-z]+$/;
			var numbers = /^[0-9]+$/;
			var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			
			   if(name1.length <=0)
		{
			alert("Select Name");
			return false;
		}
	else if(name1 == "select") 
	{
                alert("Select Name");
		return false;
        }
			
	if (rid== "" || rid== null) 
	{
            alert("Enter Driver ID");
            return false;
    	}
	
	else if (rid.length <1) 
	{
            alert("Driver ID Number Must be greater than 2 characters");
            return false;
        }

	else if (!rid.match(numbers)) 
	{
            alert("Enter Valid Driver ID");
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

	else if(!fname.match(alphaspace)) 
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
	
		
		if (sal == "" || sal== null) 
	{
                alert("Enter Salary");
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
<%!  String un1="", un2="", un3="" , un4="" , un5="" , un6="" , un7="",un8="" , un9="" , un10="",un11="pic.jpg",un12="",unid=""; %>
    <%! String uname="",gender="",mob="",addre="",filename="",itemName1="",route="",
            fname="", date1="", vreq="",lno="",qual="",value="",sal=""; %>
  <%! ResultSet myrs11 ; ResultSet myrs;%>
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
         
                 if(itemName1.equals("name1")) 
           {
                uname=value;
                
           }
                 if(itemName1.equals("fname")) 
           {
                fname=value;
                
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
                    filename=un11;
                }
                else if(type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif") && size<100)
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
    }                       
                   
                            String path2="jdbc:mysql://localhost/ecab";
                               Class.forName("com.mysql.jdbc.Driver");
                                     Connection mycon1;
                                    try
                                         {
                  
                                       mycon1=DriverManager.getConnection(path2,"root","");
                                              try
                                                    {
                                        String query ="select * from driver where driver_id=?";
                                     PreparedStatement myst=mycon1.prepareStatement(query);
                                           myst.setString(1,uname);
                                              myrs= myst.executeQuery();

                                                    if(myrs.next())
                                                    {
                                             un1 = myrs.getString("name");
                                            un2 = myrs.getString("email");   
                                            un3 = myrs.getString("father_name");
                                            un4 = myrs.getString("qualification");
                                            un5 = myrs.getString("gender");
                                               String dateReceived =myrs.getString("date_of_birth");;
                                        DateFormat userDateFormat = new SimpleDateFormat("dd-mm-yyyy");
                                        DateFormat dateFormatNeeded = new SimpleDateFormat("yyyy-mm-dd");
                                        java.util.Date date = userDateFormat.parse(dateReceived);
                                        String cd = dateFormatNeeded.format(date);
                                                    
                                            un6 = cd;
                                             un7 = myrs.getString("vehicle_required");
                                            un8 = myrs.getString("licence_no");
                                            un9 = myrs.getString("address");
                                             un10 = myrs.getString("contact_no");
                                             un11 = myrs.getString("driver_image");
                                            un12=myrs.getString("Salary");
                                            // unid= myrs.getString("name");
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
                                
                                    if(itemName1.equals("reset"))
                                                {
                                           un1=""; un2=""; un3="" ; un4="" ; un5="" ; un6="" ; 
                                           un7="";un8="" ; un9="" ; un10=""; un11="pic.jpg";un12="";      
                                                
                                                
                                                }
                                    
                                    
                                     if(itemName1.equals("update"))
                                                {
                                                    String path= "jdbc:mysql://localhost:3306/ecab";
                                                    Connection mycon;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        mycon = DriverManager.getConnection(path,"root","");
                                                        String query ="update driver set father_name=?,gender=?,date_of_birth=?,vehicle_required=?,licence_no=?,address=?,contact_no=?,driver_image=?,Salary=? where driver_id=?";



                                                        try{
                                                            PreparedStatement myst=mycon.prepareStatement(query);
                                                         //  myst.setString(1,route);
                                                   // myst.setString(1,uname);
                                                    myst.setString(1,fname);
                                                   // myst.setString(3,qual);
                                                    myst.setString(2,gender);
                                           String dateReceived =date1;
                                          DateFormat userDateFormat = new SimpleDateFormat("yyyy-mm-dd");
                                          DateFormat dateFormatNeeded = new SimpleDateFormat("dd-mm-yyyy");
                                          java.util.Date date = userDateFormat.parse(dateReceived);
                                          String cd = dateFormatNeeded.format(date);
                                              myst.setString(3,cd);
                                                     myst.setString(4,vreq);
                                                    myst.setString(5,lno);
                                                    myst.setString(6,addre);
                                                    myst.setString(7,mob);
                                                    myst.setString(8,filename);
                                                   myst.setString(9,sal);
                                                        myst.setString(10,uname);
                                        

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
                                                    un1=""; un2=""; un3="" ; un4="" ; un5="" ; un6="" ; un7="";un8="" ; un9="" ; un10=""; un11="pic.jpg"; un12="" ;
                                                }
                                     
                                                              if(itemName1.equals("Delete"))
                                                                     {
                                                    String path= "jdbc:mysql://localhost:3306/ecab";
                                                    Connection mycon;

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        mycon = DriverManager.getConnection(path,"root","");
                                                        String query ="Delete from driver where driver_id=?";
                                                            String query1 ="Delete from allusers where email=?";
                                                        try{
                                                            PreparedStatement myst=mycon.prepareStatement(query);
                                                            myst.setString(1,uname);
                                                          PreparedStatement myst1=mycon.prepareStatement(query1);
                                                            myst1.setString(1,un2);
                                                            int i= myst.executeUpdate();
                                                            int j= myst1.executeUpdate();

                                                            if(i>0 && j>0)
                                                            {
                                                                out.println("<td>Record Deleted</td>");
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
                                                      un5="" ; un6="" ; un7="";un8="" ; un9="" ; un10=""; un11="pic.jpg"; un12=""; 
                                            }
                                                              %>
 <%                                                            
    if(request.getParameter("id1")!=null)
    {
                         String path3="jdbc:mysql://localhost/ecab";
                               Class.forName("com.mysql.jdbc.Driver");
                                     Connection mycon2;
                                    try
                                         {
                  
                                       mycon2=DriverManager.getConnection(path3,"root","");
                                              try
                                                    {
                                        String query ="select * from driver where email=?";
                                     PreparedStatement myst=mycon2.prepareStatement(query);
                                           myst.setString(1,request.getParameter("id1"));
                                             ResultSet myrs= myst.executeQuery();

                                                    if(myrs.next())
                                                    {
                                             un1 = myrs.getString("name");
                                             un2 = myrs.getString("email");   
                                            un3 = myrs.getString("father_name");
                                           // un4 = myrs.getString("qualification");
                                            un5 = myrs.getString("gender");
                                               String dateReceived =myrs.getString("date_of_birth");;
                                        DateFormat userDateFormat = new SimpleDateFormat("dd-mm-yyyy");
                                        DateFormat dateFormatNeeded = new SimpleDateFormat("yyyy-mm-dd");
                                        java.util.Date date = userDateFormat.parse(dateReceived);
                                        String cd = dateFormatNeeded.format(date);
                                                    
                                            un6 = cd;
                                             un7 = myrs.getString("vehicle_required");
                                            un8 = myrs.getString("licence_no");
                                            un9 = myrs.getString("address");
                                             un10 = myrs.getString("contact_no");
                                             un11 = myrs.getString("driver_image");
                                            un12=myrs.getString("Salary");
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
        if(un1!=null)
            {
        
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from driver ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                      myrs11 = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
            } else
        {
                               
                    
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from driver ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                      myrs11 = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
        }
                               %>                                
       
        <div id="sub_menu" style="height:30px;"><u>Manage Employee Details:</u></div>
        <div style=" clear:both; width:650px; float:left;">
      <form action="" method="post" enctype="multipart/form-data" name="form1" id="form1">
        <table width="500" height="449px" border="0" align="center" cellpadding="5" class="t1">
          <tr>
               <td width="153">Name:</td>
            <td width="312"><label for="name"></label>
               
           <select name="name1" id="name1">
             <option value="select" selected>Select</option>
             <% if(myrs11.next())
             { 
                 do
                 {
                     if(un1.equals(myrs11.getString("name")))
                     {
                         out.println("<option Selected value='"+myrs11.getString("driver_id")+"'>"+myrs11.getString("name")+"</option>");
                     }
                     else
                     {
                         out.println("<option value='"+myrs11.getString("driver_id")+"'>"+myrs11.getString("name")+"</option>");
                     }
                 }while(myrs11.next());
                 
             }   
                 %>
           </select>
            <input type="submit" name="Submit2" id="Submit2" value="Show"></td>
           
          </tr>
          
          <tr>
            <td>Father Name:</td>
            <td><label for="fname"></label>
                <input type="text" name="fname" id="fname" value="<% out.print(""+un3+""); %>" /></td>
          </tr>
         
          <tr>
            <td>Gender:</td>
            <td>
              <label>
                <input type="radio" name="Gender" value="male" id="male" <% if(un5.equalsIgnoreCase("male")) out.print("checked=checked");  %> />
                Male</label>
              <label>
                <input type="radio" name="Gender" value="female" id="female" <% if(un5.equalsIgnoreCase("female")) out.print("checked=checked");  %>/>
                Female</label>
            </td>
          </tr>
          <tr>
            <td>D.O.B</td>
            <td><label for="dob"></label>
                <input type="date" name="dob" id="dob"value="<% out.print(""+un6+""); %>" /></td>
          </tr>
          <tr>
            <td>Vehicle Required:</td>
            <td>
              <label>
                <input type="radio" name="vreq" value="yes" id="vreq_0"  <% if(un7.equalsIgnoreCase("yes")) out.print("checked=checked");  %>/>
                Yes</label>
              <label>
                <input type="radio" name="vreq" value="no" id="vreq_1" <% if(un7.equalsIgnoreCase("no")) out.print("checked=checked");  %>/>
                No</label>
            </td>
          </tr>
          <tr>
            <td>Licence No:</td>
            <td><label for="lno"></label>
                <input type="text" name="lno" id="lno" value="<% out.print(""+un8+""); %>"/></td>
          </tr>
          <tr>
            <td>Address:</td>
            <td><label for="addr"></label>
            <textarea name="addr" id="addr" cols="30" rows="4"><% out.print(""+un9+""); %></textarea></td>
          </tr>
          <tr>
            <td>Contact No:</td>
            <td><label for="cno"></label>
                <input type="text" name="cno" id="cno" value="<% out.print(""+un10+""); %>"/></td>
          </tr>
          <tr>
            <td>Email:</td>
            <td><label for="email"></label>
            <input type="text" name="email" id="email" value="<% out.print(""+un2+""); %>"></td>
          </tr>
          <tr>
            <td>Salary:</td>
            <td><label for="sal"></label>
            <input type="text" name="sal" id="sal" value="<% out.print(""+un12+""); %>"></td>
          </tr>
          <tr>
            <td>Image:</td>
            <td><label for="empimg"></label>
            <input type="file" name="empimg" id="empimg"></td>
            <td>          
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="update" id="update" onclick="return validate1();" value="Update"
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
        <table width="350" height="226" border="0" cellpadding="5" cellspacing="5">
          <tr>
            <td width="350"><img src="driverimg/<% out.print(""+un11+""); %>" width="180" height="240"></td>
          </tr>
        </table>
      </div>
      </form>
    </div>
   
  <%@include file="ad_footer.jsp" %>

</body>

</html>