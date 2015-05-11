<%@ page  language="java" import="java.io.*,java.sql.*, javax.servlet.*" %>
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
	var email = document.getElementById('email').value.trim();
	var male = document.getElementById('male').checked;
        var female = document.getElementById('female').checked;
	var mno = document.getElementById('mno').value.trim();
	var addr = document.getElementById('addr').value.trim();
        var letters = /^[A-Za-z]+$/;
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var numbers = /^[0-9]+$/;
		var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
 
               
               if(name1 == "select") 
                {
                 alert("Select Name");
		return false;
                 }
	else if(name1.length <=0)
		{
			alert("Select Name");
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
<title>Manage Users</title>

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
<%!  String un1="", un2="", un3="" , un4="" , un5="" , un6="" , un7="pic.jpg",un8="";
    %>
   <%! ResultSet myrs11;%>
  <%@include file="header.jsp"%>
  <%@include file="content1.jsp" %>
    <div id="contentmid">
 <%        
            if(request.getParameter("Submit1")!=null)
            {
                    String name = request.getParameter("name1");    
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from user where name=?";
                         

                        try{
                           PreparedStatement myst=mycon.prepareStatement(query);
                            myst.setString(1,name);          
                      ResultSet myrs = myst.executeQuery();
                            
                            if(myrs.next())
                            {
                             un1 = myrs.getString("name");    
                            un2 = myrs.getString("email");
                           // un3 = myrs.getString("pwd");
                            un4 = myrs.getString("gender");
                            un5 = myrs.getString("mobile");
                            un6 = myrs.getString("addr");
                            un7=  myrs.getString("image");
                           
                            }
                            else{
                                response.sendRedirect("ad_musr.jsp");
                               out.println("</div>" +
                            "<tr><td><div style='clear:both; margin-left:5px; color:Red;'>Details Not Saved</div></td></tr>");
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
                    
            } else  if(request.getParameter("reset")!=null)
                        {
                un1=""; un2=""; un3="";un4=""; un5="";un6="";un7="pic.jpg";
                 response.sendRedirect("ad_musr.jsp");
            }
                                
                               %> 
                               
<%                                                            
    if(request.getParameter("id1")!=null)
    {
         String name = request.getParameter("name1");    
                     String path1= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon2;
                        
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                         mycon2 = DriverManager.getConnection(path1,"root","");
                         String query ="select * from user where email=?";
                         

                        try{
                           PreparedStatement myst=mycon2.prepareStatement(query);
                            myst.setString(1,request.getParameter("id1"));          
                      ResultSet myrs = myst.executeQuery();
                            
                            if(myrs.next())
                            {
                             un1 = myrs.getString("name");    
                            un2 = myrs.getString("email");
                           // un3 = myrs.getString("pwd");
                            un4 = myrs.getString("gender");
                            un5 = myrs.getString("mobile");
                            un6 = myrs.getString("addr");
                            un7=  myrs.getString("image");
                            }
                            else{
                                response.sendRedirect("ad_musr.jsp");
                               out.println("</div>" +
                            "<tr><td><div style='clear:both; margin-left:5px; color:Red;'>Details Not Saved</div></td></tr>");
                            }
                        } catch (Exception e) {
                           out.println("Error due to"+e.getMessage());
                        }
                        finally
                        {
                            mycon2.close();
                        }
                    }
                    catch(Exception e)
                    {
                        out.println("Error in connection"+e.getMessage() );
                    }
                        request.setAttribute("id1",null);
    }
                                                              
%>       

 <%        
                        try{
                     String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon;
                    Class.forName("com.mysql.jdbc.Driver");
                         mycon = DriverManager.getConnection(path,"root","");
                         String query ="select * from user ";
                      PreparedStatement myst=mycon.prepareStatement(query);
                         myrs11 = myst.executeQuery();
                        }
                        catch(Exception e){
                            out.println("Error in connection"+e.getMessage() );
                        }
                    
                               %> 


     <div id="sub_menu"><u>Manage User Details:</u></div>
     <div style=" clear:both; width:650px; float:left;">
     <form action="" method="post"  name="form1">
       <table width="518" height="437" border="0" align="center" cellpadding="5" cellspacing="5" class="t1">
           
             <tr>
               <td width="172">Name:</td>
               <td width="398">
                
                 <select name="name1" id="name1">
             <option value="select" selected>Select</option>
                 <% if(myrs11.next())
             { 
                 do
                 {
                     if(un1.equals(myrs11.getString("name")))
                     {
                         out.println("<option Selected>"+myrs11.getString("name")+"</option>");
                     }
                     else
                     {
                         out.println("<option>"+myrs11.getString("name")+"</option>");
                     }
                 }while(myrs11.next());
                 
             }   
                 %>
                 
                 </select>
                 <input type="submit" name="Submit1" id="Submit" value="Show"></td>
             </tr>
             
             <tr>
             <td>Email:</td>
               <td><label for="uname"></label>
                 <label for="email"></label>
                 <input type="text" name="email" id="email" value="<% out.print(""+un2+""); %>" disabled/>
               </td>
             </tr>
             
             
             <tr>
               <td>Gender:</td>
               <td><label>
                  <input type="radio" name="gender" value="male" id="male" <% if(un4.equalsIgnoreCase("male")) out.print("checked=checked");  %> />
                 Male</label>
                 <label>
                   <input type="radio" name="gender" value="female" id="female"<% if(un4.equalsIgnoreCase("female")) out.print("checked=checked");  %> />
                   Female</label></td>
             </tr>
             
             <tr>
               <td>Mobile No:</td>
               <td><label for="mno"></label>
                 <input type="text" name="mno" id="mno" value="<% out.print(""+un5+""); %>"></td>
             </tr>
             <tr>
               <td>Address:</td>
               <td><label for="addr"></label>
                 <textarea name="addr" cols="30" rows="8" id="addr"><% out.print(""+un6+""); %></textarea></td>
             </tr>
             <tr>
               <td>&nbsp;</td>
               <td><input type="submit" name="update" id="update" onclick="return validate1();" value="Update"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
                       <input type="submit" name="reset" id="reset" value="Reset" 
                              style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
                              <input type="submit" name="Delete" id="Delete" value="Delete" onclick="javascript: return confirm('Please confirm deletion');"
             style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;">
             </td>
             
             </tr>
           
              <%    if(request.getParameter("update")!=null)
                            {
                               
            String userid = request.getParameter("name1");    
            String mail = un2;
         
            String gender1 = request.getParameter("gender");    
            String mobile = request.getParameter("mno");
             String address = request.getParameter("addr");
           
                 String path= "jdbc:mysql://localhost:3306/ecab";
                //  String place="courierdb";
                Connection mycon;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    mycon = DriverManager.getConnection(path,"root","");
                    String query ="update user set name=?,gender=?,mobile=?,addr=? where email=?";


                    try{
                        PreparedStatement myst=mycon.prepareStatement(query);
                        myst.setString(1,userid);
                        myst.setString(2,gender1);
                        myst.setString(3,mobile);
                        myst.setString(4,address);
                         myst.setString(5,mail);
                        int i= myst.executeUpdate();

                        if(i>0)
                        {
                            out.println("<td><div style='clear:both; color:Green; font-size:12px;'>Details Updated</td>");
                        }
                        else{
                           out.println("</div>" +
                        "<td><div style='clear:both; margin-left:5px; color:Red;'>Details Not Updated</div></td>");
                            
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
                 
              
              if(request.getParameter("Delete")!=null)
                            {
            String userid = request.getParameter("name1");    
                 String path= "jdbc:mysql://localhost:3306/ecab";
                Connection mycon;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    mycon = DriverManager.getConnection(path,"root","");
                    String query ="Delete from user where email=?";
                     String query1 ="Delete from allusers where email=?";

                    try{
                        PreparedStatement myst=mycon.prepareStatement(query);
                        myst.setString(1,un2);
                        PreparedStatement myst1=mycon.prepareStatement(query1);
                        myst1.setString(1,un2);
                        int i= myst.executeUpdate();
                        int j= myst1.executeUpdate();

                        if(i>0 && j>0)
                        {
                            out.println("<td><div style='clear:both; color:Green; font-size:12px;'>Record Deleted</td>");
                        }
                        else{
                           out.println("</div>" +
                        "<td><div style='clear:both; margin-left:5px; color:Red;'>Record Not Deleted</div></td>");
                            
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
                un1=""; un2=""; un3="";un4=""; un5="";un6="";un7="pic.jpg";
            }
%>
		</tr>
       </table>
      
       
     
     </div>
      <div style=" width:350px; float:left;">
        <table width="350" height="226" border="0" cellpadding="5" cellspacing="5">
          <tr>
            <td width="350"><img src="userimg/<% out.print(""+un7+""); %>" width="180" height="240"></td>
          </tr>
        </table>
      </div>
      </form>
    </div>
   
    
       <%@include file="ad_footer.jsp" %>
</body>

</html>