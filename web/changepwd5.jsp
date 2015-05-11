<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<script language="javascript" type="text/javascript">
function validate()
{
	var prepwd = document.getElementById('prepwd').value.trim();
	var pwd = document.getElementById('pwd').value.trim();
	var rpwd = document.getElementById('repwd').value.trim();
 
	if (prepwd == "" || prepwd == null) 
	{
      alert("Enter Previous Password");
	  return false;       
    } 
	else if (prepwd.length <= 5) 
	{
      alert("Previous Password Must be in 6 or more characters");
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
}
</script>
    <h1 style="color:#336699; font-size:26px;"><u>Enter Details:</u></h1>
	  <form name="form1" method="post" onsubmit="parent.$.fancybox.close(); " target="_parent">
	    <table width="508" height="161" border="0" align="center" cellpadding="5" cellspacing="5" 
                   style="color:#336699; font-size:20px;">
	      <tr>
	        <td align="left">Prev. Password</td>
	        <td align="left">:</td>
	        <td><input type="password" name="prepwd" id="prepwd" style="height:30px; width:250px; font-size:20px;" /></td>
          </tr>
	      <tr>
	        <td width="116" align="left">New Password</td>
	        <td width="8" align="left">:</td>
	        <td width="260"><label for="pwd"></label>
            <input type="password" name="pwd" id="pwd" style="height:30px; width:250px; font-size:20px;"></td>
          </tr>
	      <tr>
	        <td align="left">Re-Password</td>
	        <td align="left">:</td>
	        <td><label for="repwd"></label>
            <input type="password" name="repwd" id="repwd" style="height:30px; width:250px; font-size:20px;"></td>
          </tr>
	      <tr align="right">
	        <td align="left">&nbsp;</td>
	        <td align="left">&nbsp;</td>
                <td><input type="submit" name="Submit" id="Submit" value="Confirm"  onclick="return validate();"  
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"></td>
          </tr>
        </table>
	 
      
         <% 
             
              if(request.getParameter("Submit")!=null)
                            {
             String semail=session.getAttribute("email1").toString();
             String pwd = request.getParameter("pwd");
              String rpwd = request.getParameter("repwd");
           String prepwd = request.getParameter("prepwd");
           
                    if(pwd.equals(rpwd))
            {
       
                try {
                    String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon1;
                    Class.forName("com.mysql.jdbc.Driver");
                    mycon1 = DriverManager.getConnection(path,"root","");
                  String query ="update allusers set password=MD5(?) where email=? and password=MD5(?)";


                    try{
                        PreparedStatement myst=mycon1.prepareStatement(query);
                        myst.setString(1,pwd);  
                         myst.setString(2,semail);
                          myst.setString(3,prepwd);
                        int i= myst.executeUpdate();

                        if(i>0)
                        {
                            // out.println("Password Changed");
                          response.sendRedirect("welcome_ecab.jsp?msg=true");
                        }
                        else{
                           out.println("<div style='clear:both; color:red; font-size:18px;'> Password Not Changed</div>");
                        }
                    } catch (Exception e) {
                       out.println("Error due to"+e.getMessage());
                    }
                    finally
                    {
                        mycon1.close();
                    }
                }
                catch(Exception e)
                {
                    out.println("Error in connection"+e.getMessage() );
                }

            } else {
                       out.println("<div style='clear:both; color:red; font-size:18px;'>PASSWORD/CONFIRM PASSWORD MISMATCH</div>");   
                        
                    }
}
                  
%>
</form>