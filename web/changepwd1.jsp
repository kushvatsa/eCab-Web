	<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
        <script language="javascript" type="text/javascript">
function validatepwd()
{       
        var sques = document.getElementById('sques').value.trim();
        var sans = document.getElementById('sans').value.trim();
	var pwd = document.getElementById('pwd').value.trim();
	var rpwd = document.getElementById('repwd').value.trim();
        
	if(sques.length <=0)
	{
            alert("Select Security Question");
            return false;
	}
	else if(sques == "Select")
	{
            alert("Select Security Question");
            return false;
	}
        if (sans == "" || sans == null) 
	{
            alert("Enter Security Answer");
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
	  <form name="form1" method="post" action="" onsubmit="parent.$.fancybox.close(); " target="_parent">
	    <table width="530" height="205" border="0" align="center" cellpadding="5" cellspacing="5" style="color:#336699; font-size:20px;">
	      <tr>
	        <td width="116" align="left">Security Question</td>
	        <td width="8" align="left">:</td>
	        <td width="260"><label for="sques">
	          <select name="sques" id="sques" style="height:30px; width:250px; font-size:20px;">
	            <option selected>Select</option>
	          <option>Your Childhood Name?</option>
                  <option>First School Name?</option>
                  <option>Mother's Maiden Name?</option>
                  <option>Favourite Actor?</option>
              </select>
	        </label></td>
          </tr>
	      <tr>
	        <td align="left">Security Answer</td>
	        <td align="left">:</td>
	        <td><label for="sans"></label>
            <input type="text" name="sans" id="sans" style="height:30px; width:250px; font-size:20px;"></td>
          </tr>
	      <tr>
	        <td align="left">New Password</td>
	        <td align="left">:</td>
	        <td><label for="pwd"></label>
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
                <td><input type="submit" name="Submit" id="Submit" value="Confirm" onclick="return validatepwd();"
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"></td>
          </tr>
        </table>
	  <% 
             
              if(request.getParameter("Submit")!=null)
                            {
                                
             String semail=session.getAttribute("email1").toString();
             String pwd = request.getParameter("pwd");
              String rpwd = request.getParameter("repwd");
               String sques = request.getParameter("sques");
              String sans = request.getParameter("sans");
           
           
                    if(pwd.equals(rpwd))
            {
       
                try {
                    String path= "jdbc:mysql://localhost:3306/ecab";
                    Connection mycon1;
                    Class.forName("com.mysql.jdbc.Driver");
                    mycon1 = DriverManager.getConnection(path,"root","");
                    String query ="update allusers set password=MD5(?) where email=? and sques=? and sans=?";


                    try{
                        PreparedStatement myst=mycon1.prepareStatement(query);
                        myst.setString(1,pwd);  
                         myst.setString(2,semail);
                         myst.setString(3,sques);  
                         myst.setString(4,sans);
                        int i= myst.executeUpdate();

                        if(i>0)
                        {
                             response.sendRedirect("welcome_ecab.jsp?msg=true");
                           
                        }
                        else{
                           out.println("<td>Password Not Changed</td>");
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
                       out.println("<td>PASSWORD/CONFIRM PASSWORD MISMATCH</td>");   
                        
                    }
}
                  
%>
      </form>